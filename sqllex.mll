{
  open Sqlparse ;;
  exception Eoi ;;


let initial_string_buffer = Bytes.create 256;;
  let string_buff = ref initial_string_buffer;;
  let string_index = ref 0;;

let reset_string_buffer () =
  string_buff := initial_string_buffer;
  string_index := 0;;

let store_string_char c =
  if !string_index >= Bytes.length (!string_buff) then begin
    let new_buff = Bytes.create (Bytes.length (!string_buff) * 2) in
    Bytes.blit (!string_buff) 0 new_buff 0 (Bytes.length (!string_buff));
    string_buff := new_buff
  end;
  Bytes.unsafe_set (!string_buff) (!string_index) c;
  incr string_index;;

let get_stored_string () =
  let s = Bytes.to_string (Bytes.sub (!string_buff) 0 (!string_index)) in
  string_buff := initial_string_buffer;
  s;;

let char_for_backslash c = match c with
| 'n' -> '\010'
| 'r' -> '\013'
| 'b' -> '\008'
| 't' -> '\009'
| c   -> c

let char_for_decimal_code lexbuf i =
  let c = 100 * (Char.code(Lexing.lexeme_char lexbuf i) - 48) +
      10 * (Char.code(Lexing.lexeme_char lexbuf (i+1)) - 48) +
                  (Char.code(Lexing.lexeme_char lexbuf (i+2)) - 48) in
  if (c < 0 || c > 255)
  then raise (Failure ("Illegal_escape: " ^ (Lexing.lexeme lexbuf)))
  else Char.chr c;;

let char_for_hexadecimal_code lexbuf i =
  let d1 = Char.code (Lexing.lexeme_char lexbuf i) in
  let val1 = if d1 >= 97 then d1 - 87
  else if d1 >= 65 then d1 - 55
  else d1 - 48
  in
  let d2 = Char.code (Lexing.lexeme_char lexbuf (i+1)) in
  let val2 = if d2 >= 97 then d2 - 87
  else if d2 >= 65 then d2 - 55
  else d2 - 48
  in
  Char.chr (val1 * 16 + val2);;


exception LexError of (Lexing.position * Lexing.position) ;;
let line_number = ref 0 ;;

let incr_line_number lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in
  lexbuf.Lexing.lex_curr_p <- { pos with
    Lexing.pos_lnum = pos.Lexing.pos_lnum + 1 ;
    Lexing.pos_bol = pos.Lexing.pos_cnum }

}

let newline = ('\010' | '\013' | "\013\010")

rule token = parse
  | [' ' '\t' '\r' '\n']+  { token lexbuf }
  | "/*"                    { in_c_comment lexbuf }
  | "//"                    { in_cpp_comment lexbuf }
  | "select"|"SELECT"       { SELECT }
  | "from"|"FROM"           { FROM }
  | "where"|"WHERE"         { WHERE }
  | "insert"|"INSERT"       { INSERT }
  | "into"|"INTO"           { INTO }
  | "values"|"VALUES"       { VALUES }
  | "create"|"CREATE"       { CREATE }
  | "table"|"TABLE"         { TABLE }
  | "update"|"UPDATE"       { UPDATE }
  | "set"|"SET"             { SET }  
  | "delete"|"DELETE"       { DELETE }
  | "drop"|"DROP"           { DROP }
  | "and"|"AND"             { AND }
  | "or"|"OR"               { OR }
  | "not"|"NOT"             { NOT }
  | "integer"|"INTEGER"     { INTEGER }
  | "varchar"|"VARCHAR"     { VARCHAR }
  | ['0'-'9']+              { INT(int_of_string (Lexing.lexeme lexbuf)) }
  |"\""['a'-'z' 'A'-'Z' '_']+"\""   {STRING(Lexing.lexeme lexbuf)}
  | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']*   { ID(Lexing.lexeme lexbuf) }
  | '"'                     { reset_string_buffer();
                             in_string lexbuf;
                             STRING (get_stored_string()) }
  | '='                     { EQUAL }
  | '>'                     { GREATER }
  | '<'                     { SMALLER }
  | ">="                    { GREATEREQUAL }
  | "<="                    { SMALLEREQUAL }
  | '+'                     { PLUS }
  | '-'                     { MINUS }
  | '*'                     { STAR }
  | '/'                     { DIVIDE }
  |'('                      {LPAR}
  |')'                      {RPAR}
  | ','                     { COMMA }
  | ';'                     { SEMICOLON }
  | '.'                      { DOT }
  | eof                     { raise Eoi }
  | _                       { raise (Failure "Illegal character") }

and in_string = parse
    '"'
      { () }
  | '\\' ['\\' '\'' '"' 'n' 't' 'b' 'r' ' ']
      { store_string_char(char_for_backslash(Lexing.lexeme_char lexbuf 1));
        in_string lexbuf }
  | '\\' ['0'-'9'] ['0'-'9'] ['0'-'9']
      { store_string_char(char_for_decimal_code lexbuf 1);
        in_string lexbuf }
  | '\\' 'x' ['0'-'9' 'a'-'f' 'A'-'F'] ['0'-'9' 'a'-'f' 'A'-'F']
      { store_string_char(char_for_hexadecimal_code lexbuf 2);
         in_string lexbuf }
  | '\\' _ as chars
      { skip_to_eol lexbuf; raise (Failure("Illegal escape: " ^ chars)) }
  | newline as s
      { for i = 0 to String.length s - 1 do
          store_string_char s.[i];
        done;
        in_string lexbuf
      }
  | eof
      { raise Eoi }
  | _ as c
      { store_string_char c; in_string lexbuf }

and in_cpp_comment = parse
    '\n' { token lexbuf }
  | _    { in_cpp_comment lexbuf }
  | eof  { raise Eoi }

and in_c_comment = parse
    "*/" { token lexbuf }
  | _    { in_c_comment lexbuf }
  | eof  { raise Eoi }

and skip_to_eol = parse
    newline { () }
  | _       { skip_to_eol lexbuf }
