{
 open sqlparse ;;
  exception Eoi ;;

(* Emprunt� de l'analyseur lexical du compilateur OCaml *)
(* To buffer string literals *)

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
  | "/*"                    { in_comment 0 lexbuf }
  | "//"                    { in_comment 1 lexbuf }
  | "select"|"SELECT"       { SELECT }
  | "from"|"FROM"           { FROM }
  | "where"|"WHERE"         { WHERE }
  | "and"|"AND"             { AND }
  | "or"|"OR"               { OR }
  | "not"|"NOT"             { NOT }
  | ['0'-'9']+              { INT(int_of_string (Lexing.lexeme lexbuf)) }
  | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']*   { IDENT(Lexing.lexeme lexbuf) }
  | '"'                     { in_string lexbuf }
  | '='                     { EQUAL }
  | '>'                     { GREATER }
  | '<'                     { SMALLER }
  | ">="                    { GREATEREQUAL }
  | "<="                    { SMALLEREQUAL }
  | '+'                     { PLUS }
  | '-'                     { MINUS }
  | '*'                     { STAR }
  | '/'                     { DIVIDE }
  | ','                     { COMMA }
  | ';'                     { SEMICOLON }
  | eof                     { raise Eoi }
  | _                       { raise (Failure "Illegal character") }

and in_string lexbuf =
  let buf = Buffer.create 17 in
  let rec aux () =
    match%sedlex lexbuf with
    | '"' -> Buffer.contents buf
    | '\\' -> Buffer.add_char buf (read_escaped lexbuf); aux ()
    | any -> Buffer.add_char buf (Sedlexing.Latin1.next lexbuf); aux ()
    | eof -> raise (Failure "String not terminated")
    | _ -> aux ()
  in aux ()

and in_comment kind lexbuf =
  match kind with
  | 0 -> (* C-style comment *)
    let rec aux () =
      match%sedlex lexbuf with
      | "*/" -> ()
      | eof -> raise (Failure "Comment not terminated")
      | any -> aux ()
    in aux ()
  | 1 -> (* C++-style comment *)
    let rec aux () =
      match%sedlex lexbuf with
      | '\n' | '\r' -> ()
      | eof -> ()
      | any -> aux ()
    in aux ()
  | _ -> ()
