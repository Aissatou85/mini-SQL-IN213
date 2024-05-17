type token =
  | INT of (int)
  | STRING of (string)
  | ID of (string)
  | FLOAT of (float)
  | SELECT
  | FROM
  | WHERE
  | AND
  | OR
  | NOT
  | PLUS
  | MINUS
  | STAR
  | DIVIDE
  | LPAR
  | RPAR
  | EQUAL
  | COMMA
  | DOT
  | GREATER
  | SMALLER
  | GREATEREQUAL
  | SMALLEREQUAL
  | SEMICOLON
  | AS

open Parsing;;
let _ = parse_error;;
# 2 "sqlparse.mly"

open Sqlast

# 35 "sqlparse.ml"
let yytransl_const = [|
  261 (* SELECT *);
  262 (* FROM *);
  263 (* WHERE *);
  264 (* AND *);
  265 (* OR *);
  266 (* NOT *);
  267 (* PLUS *);
  268 (* MINUS *);
  269 (* STAR *);
  270 (* DIVIDE *);
  271 (* LPAR *);
  272 (* RPAR *);
  273 (* EQUAL *);
  274 (* COMMA *);
  275 (* DOT *);
  276 (* GREATER *);
  277 (* SMALLER *);
  278 (* GREATEREQUAL *);
  279 (* SMALLEREQUAL *);
  280 (* SEMICOLON *);
  281 (* AS *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* STRING *);
  259 (* ID *);
  260 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\005\000\003\000\003\000\007\000\007\000\
\008\000\008\000\004\000\006\000\006\000\006\000\006\000\010\000\
\010\000\011\000\011\000\011\000\011\000\011\000\009\000\009\000\
\009\000\009\000\009\000\009\000\012\000\013\000\013\000\013\000\
\013\000\000\000"

let yylen = "\002\000\
\002\000\002\000\005\000\002\000\001\000\001\000\001\000\003\000\
\001\000\003\000\001\000\001\000\002\000\003\000\003\000\003\000\
\003\000\001\000\001\000\001\000\001\000\001\000\001\000\003\000\
\001\000\001\000\001\000\003\000\003\000\001\000\001\000\001\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\034\000\000\000\025\000\027\000\
\000\000\026\000\005\000\000\000\000\000\006\000\000\000\000\000\
\023\000\001\000\002\000\000\000\000\000\000\000\000\000\030\000\
\031\000\032\000\033\000\000\000\000\000\029\000\024\000\011\000\
\000\000\008\000\010\000\000\000\000\000\003\000\000\000\000\000\
\000\000\000\000\012\000\013\000\000\000\000\000\000\000\000\000\
\018\000\020\000\019\000\022\000\021\000\000\000\016\000\014\000\
\000\000\000\000"

let yydgoto = "\002\000\
\005\000\006\000\013\000\033\000\038\000\041\000\014\000\015\000\
\042\000\043\000\054\000\017\000\029\000"

let yysindex = "\005\000\
\253\254\000\000\032\255\253\254\000\000\233\254\000\000\000\000\
\245\254\000\000\000\000\053\255\004\255\000\000\250\254\047\255\
\000\000\000\000\000\000\015\255\091\255\043\255\053\255\000\000\
\000\000\000\000\000\000\046\255\053\255\000\000\000\000\000\000\
\031\255\000\000\000\000\097\255\038\255\000\000\038\255\038\255\
\035\255\075\255\000\000\000\000\085\255\062\255\038\255\038\255\
\000\000\000\000\000\000\000\000\000\000\053\255\000\000\000\000\
\042\255\097\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\058\255\255\254\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\007\255\000\000\000\000\000\000\000\000\
\028\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\254\254\251\254"

let yygindex = "\000\000\
\061\000\000\000\000\000\000\000\000\000\023\000\043\000\000\000\
\253\255\000\000\000\000\000\000\000\000"

let yytablesize = 111
let yytable = "\016\000\
\019\000\003\000\017\000\017\000\009\000\001\000\015\000\020\000\
\021\000\022\000\017\000\023\000\028\000\015\000\028\000\028\000\
\009\000\030\000\017\000\016\000\004\000\015\000\028\000\028\000\
\028\000\036\000\028\000\028\000\028\000\028\000\028\000\028\000\
\007\000\008\000\009\000\010\000\046\000\037\000\007\000\008\000\
\009\000\010\000\047\000\048\000\011\000\032\000\012\000\039\000\
\035\000\047\000\058\000\004\000\040\000\007\000\008\000\009\000\
\010\000\024\000\025\000\026\000\027\000\044\000\045\000\007\000\
\018\000\034\000\000\000\012\000\000\000\056\000\057\000\028\000\
\024\000\025\000\026\000\027\000\000\000\031\000\049\000\000\000\
\000\000\050\000\051\000\052\000\053\000\024\000\025\000\026\000\
\027\000\000\000\000\000\049\000\047\000\048\000\050\000\051\000\
\052\000\053\000\000\000\000\000\055\000\024\000\025\000\026\000\
\027\000\000\000\031\000\024\000\025\000\026\000\027\000"

let yycheck = "\003\000\
\024\001\005\001\008\001\009\001\006\001\001\000\009\001\019\001\
\012\000\006\001\016\001\018\001\006\001\016\001\008\001\009\001\
\018\001\003\001\024\001\023\000\024\001\024\001\016\001\017\001\
\018\001\029\000\020\001\021\001\022\001\023\001\024\001\025\001\
\001\001\002\001\003\001\004\001\040\000\007\001\001\001\002\001\
\003\001\004\001\008\001\009\001\013\001\003\001\015\001\010\001\
\003\001\008\001\054\000\024\001\015\001\001\001\002\001\003\001\
\004\001\011\001\012\001\013\001\014\001\039\000\040\000\006\001\
\004\000\023\000\255\255\015\001\255\255\047\000\048\000\025\001\
\011\001\012\001\013\001\014\001\255\255\016\001\017\001\255\255\
\255\255\020\001\021\001\022\001\023\001\011\001\012\001\013\001\
\014\001\255\255\255\255\017\001\008\001\009\001\020\001\021\001\
\022\001\023\001\255\255\255\255\016\001\011\001\012\001\013\001\
\014\001\255\255\016\001\011\001\012\001\013\001\014\001"

let yynames_const = "\
  SELECT\000\
  FROM\000\
  WHERE\000\
  AND\000\
  OR\000\
  NOT\000\
  PLUS\000\
  MINUS\000\
  STAR\000\
  DIVIDE\000\
  LPAR\000\
  RPAR\000\
  EQUAL\000\
  COMMA\000\
  DOT\000\
  GREATER\000\
  SMALLER\000\
  GREATEREQUAL\000\
  SMALLEREQUAL\000\
  SEMICOLON\000\
  AS\000\
  "

let yynames_block = "\
  INT\000\
  STRING\000\
  ID\000\
  FLOAT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Sqlast.simple_query) in
    Obj.repr(
# 43 "sqlparse.mly"
                      (_2)
# 190 "sqlparse.ml"
               : Sqlast.simple_query))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_query) in
    Obj.repr(
# 44 "sqlparse.mly"
                              (_1)
# 197 "sqlparse.ml"
               : Sqlast.simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'projection) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'where) in
    Obj.repr(
# 48 "sqlparse.mly"
                                         ( Squery (_2, _4 ,_5))
# 206 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 51 "sqlparse.mly"
                     (_2)
# 213 "sqlparse.ml"
               : 'where))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "sqlparse.mly"
                ( Asterix )
# 219 "sqlparse.ml"
               : 'projection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'projection_bis) in
    Obj.repr(
# 55 "sqlparse.mly"
                        (Pro _1)
# 226 "sqlparse.ml"
               : 'projection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'column) in
    Obj.repr(
# 58 "sqlparse.mly"
                (Col _1)
# 233 "sqlparse.ml"
               : 'projection_bis))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'column) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'projection_bis) in
    Obj.repr(
# 59 "sqlparse.mly"
                                     (Col2 (_1 ,_3))
# 241 "sqlparse.ml"
               : 'projection_bis))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 62 "sqlparse.mly"
                             ( Ex _1  )
# 248 "sqlparse.ml"
               : 'column))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 63 "sqlparse.mly"
                             ( ExID (_1 , _3) )
# 256 "sqlparse.ml"
               : 'column))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 66 "sqlparse.mly"
               ( ID _1 )
# 263 "sqlparse.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'predicate) in
    Obj.repr(
# 72 "sqlparse.mly"
                       ( Pred _1 )
# 270 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 73 "sqlparse.mly"
                        ( Not _2 )
# 277 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'condition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 74 "sqlparse.mly"
                             ( And (_1 , _3) )
# 285 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'condition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 75 "sqlparse.mly"
                            ( Or (_1 , _3) )
# 293 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'condition) in
    Obj.repr(
# 80 "sqlparse.mly"
                         ( Par _2 )
# 300 "sqlparse.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'sep) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "sqlparse.mly"
                         ( Sep (_1 , _3 , _2) )
# 309 "sqlparse.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    Obj.repr(
# 84 "sqlparse.mly"
             ( Eq )
# 315 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "sqlparse.mly"
                ( Lt )
# 321 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 86 "sqlparse.mly"
               ( Gt )
# 327 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 87 "sqlparse.mly"
                     ( Le )
# 333 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 88 "sqlparse.mly"
                    ( Ge )
# 339 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 91 "sqlparse.mly"
                    ( Att _1 )
# 346 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 92 "sqlparse.mly"
                    ( Parexp _2 )
# 353 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 93 "sqlparse.mly"
                    ( Int _1 )
# 360 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 94 "sqlparse.mly"
                    ( Float _1 )
# 367 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 95 "sqlparse.mly"
                    ( String _1 )
# 374 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'operation) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "sqlparse.mly"
                         ( Ope (_1 , _3 , _2) )
# 383 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 100 "sqlparse.mly"
               ( Dot (_1 , _3))
# 391 "sqlparse.ml"
               : 'attribute))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "sqlparse.mly"
               ( Plus )
# 397 "sqlparse.ml"
               : 'operation))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "sqlparse.mly"
               ( Minus )
# 403 "sqlparse.ml"
               : 'operation))
; (fun __caml_parser_env ->
    Obj.repr(
# 105 "sqlparse.mly"
               ( Astrix )
# 409 "sqlparse.ml"
               : 'operation))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "sqlparse.mly"
               ( Slash )
# 415 "sqlparse.ml"
               : 'operation))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Sqlast.simple_query)
