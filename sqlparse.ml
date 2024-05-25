type token =
  | INT of (int)
  | STRING of (string)
  | ID of (string)
  | FLOAT of (float)
  | SELECT
  | FROM
  | WHERE
  | CREATE
  | TABLE
  | INSERT
  | INTO
  | VALUES
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
  | INTEGER
  | VARCHAR

open Parsing;;
let _ = parse_error;;
# 2 "sqlparse.mly"

open Sqlast

# 42 "sqlparse.ml"
let yytransl_const = [|
  261 (* SELECT *);
  262 (* FROM *);
  263 (* WHERE *);
  264 (* CREATE *);
  265 (* TABLE *);
  266 (* INSERT *);
  267 (* INTO *);
  268 (* VALUES *);
  269 (* AND *);
  270 (* OR *);
  271 (* NOT *);
  272 (* PLUS *);
  273 (* MINUS *);
  274 (* STAR *);
  275 (* DIVIDE *);
  276 (* LPAR *);
  277 (* RPAR *);
  278 (* EQUAL *);
  279 (* COMMA *);
  280 (* DOT *);
  281 (* GREATER *);
  282 (* SMALLER *);
  283 (* GREATEREQUAL *);
  284 (* SMALLEREQUAL *);
  285 (* SEMICOLON *);
  286 (* AS *);
  287 (* INTEGER *);
  288 (* VARCHAR *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* STRING *);
  259 (* ID *);
  260 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\005\000\003\000\003\000\
\009\000\009\000\010\000\010\000\012\000\006\000\006\000\006\000\
\004\000\008\000\008\000\008\000\008\000\013\000\013\000\014\000\
\014\000\014\000\014\000\014\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\007\000\007\000\007\000\
\015\000\000\000"

let yylen = "\002\000\
\002\000\002\000\005\000\004\000\005\000\002\000\001\000\001\000\
\001\000\003\000\001\000\003\000\001\000\000\000\001\000\003\000\
\001\000\001\000\002\000\003\000\003\000\003\000\003\000\001\000\
\001\000\001\000\001\000\001\000\001\000\003\000\001\000\001\000\
\001\000\003\000\003\000\003\000\003\000\000\000\001\000\003\000\
\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\042\000\000\000\
\031\000\033\000\000\000\032\000\007\000\000\000\000\000\008\000\
\000\000\000\000\029\000\000\000\000\000\001\000\002\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\017\000\000\000\000\000\041\000\030\000\000\000\010\000\000\000\
\000\000\036\000\037\000\012\000\013\000\004\000\000\000\000\000\
\000\000\003\000\000\000\005\000\000\000\000\000\000\000\000\000\
\000\000\018\000\016\000\000\000\019\000\000\000\000\000\000\000\
\000\000\024\000\026\000\025\000\028\000\027\000\000\000\040\000\
\022\000\020\000\000\000\000\000"

let yydgoto = "\002\000\
\007\000\008\000\015\000\034\000\050\000\046\000\052\000\056\000\
\016\000\017\000\057\000\047\000\058\000\071\000\019\000"

let yysindex = "\002\000\
\000\255\000\000\012\255\253\254\026\255\000\255\000\000\009\255\
\000\000\000\000\027\255\000\000\000\000\088\255\047\255\000\000\
\042\255\081\255\000\000\066\255\066\255\000\000\000\000\067\255\
\122\255\066\255\088\255\088\255\088\255\088\255\088\255\070\255\
\000\000\075\255\083\255\000\000\000\000\089\255\000\000\004\255\
\004\255\000\000\000\000\000\000\000\000\000\000\059\255\088\255\
\016\255\000\000\075\255\000\000\087\255\016\255\016\255\021\255\
\109\255\000\000\000\000\088\255\000\000\244\254\096\255\016\255\
\016\255\000\000\000\000\000\000\000\000\000\000\088\255\000\000\
\000\000\000\000\094\255\025\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\110\255\254\254\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\073\255\000\000\000\000\000\000\000\000\000\000\033\255\
\058\255\000\000\000\000\000\000\000\000\000\000\090\255\091\255\
\000\000\000\000\073\255\000\000\100\255\000\000\000\000\101\255\
\000\000\000\000\000\000\091\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\019\255\080\255"

let yygindex = "\000\000\
\126\000\000\000\000\000\242\255\000\000\082\000\084\000\012\000\
\115\000\000\000\253\255\000\000\000\000\000\000\000\000"

let yytablesize = 144
let yytable = "\018\000\
\064\000\065\000\001\000\011\000\003\000\020\000\035\000\004\000\
\073\000\005\000\025\000\038\000\009\000\010\000\011\000\012\000\
\009\000\010\000\011\000\012\000\011\000\030\000\031\000\018\000\
\040\000\041\000\042\000\043\000\006\000\013\000\054\000\014\000\
\021\000\064\000\065\000\055\000\021\000\023\000\034\000\021\000\
\028\000\029\000\030\000\031\000\053\000\034\000\034\000\021\000\
\034\000\034\000\024\000\063\000\026\000\034\000\034\000\034\000\
\053\000\034\000\034\000\034\000\034\000\034\000\034\000\035\000\
\027\000\061\000\062\000\076\000\033\000\036\000\035\000\035\000\
\044\000\035\000\035\000\074\000\075\000\045\000\035\000\035\000\
\035\000\051\000\035\000\035\000\035\000\035\000\035\000\035\000\
\009\000\010\000\011\000\012\000\023\000\023\000\048\000\049\000\
\028\000\029\000\030\000\031\000\023\000\014\000\028\000\029\000\
\030\000\031\000\064\000\014\000\023\000\060\000\032\000\028\000\
\029\000\030\000\031\000\009\000\037\000\066\000\015\000\038\000\
\067\000\068\000\069\000\070\000\028\000\029\000\030\000\031\000\
\039\000\006\000\066\000\022\000\059\000\067\000\068\000\069\000\
\070\000\028\000\029\000\030\000\031\000\039\000\037\000\072\000"

let yycheck = "\003\000\
\013\001\014\001\001\000\006\001\005\001\009\001\021\000\008\001\
\021\001\010\001\014\000\026\000\001\001\002\001\003\001\004\001\
\001\001\002\001\003\001\004\001\023\001\018\001\019\001\027\000\
\028\000\029\000\030\000\031\000\029\001\018\001\015\001\020\001\
\014\001\013\001\014\001\020\001\011\001\029\001\006\001\021\001\
\016\001\017\001\018\001\019\001\048\000\013\001\014\001\029\001\
\016\001\017\001\024\001\055\000\006\001\021\001\022\001\023\001\
\060\000\025\001\026\001\027\001\028\001\029\001\030\001\006\001\
\023\001\054\000\055\000\071\000\003\001\003\001\013\001\014\001\
\003\001\016\001\017\001\064\000\065\000\003\001\021\001\022\001\
\023\001\023\001\025\001\026\001\027\001\028\001\029\001\030\001\
\001\001\002\001\003\001\004\001\013\001\014\001\012\001\007\001\
\016\001\017\001\018\001\019\001\021\001\029\001\016\001\017\001\
\018\001\019\001\013\001\020\001\029\001\023\001\030\001\016\001\
\017\001\018\001\019\001\006\001\021\001\022\001\029\001\029\001\
\025\001\026\001\027\001\028\001\016\001\017\001\018\001\019\001\
\029\001\029\001\022\001\006\000\051\000\025\001\026\001\027\001\
\028\001\016\001\017\001\018\001\019\001\027\000\021\001\060\000"

let yynames_const = "\
  SELECT\000\
  FROM\000\
  WHERE\000\
  CREATE\000\
  TABLE\000\
  INSERT\000\
  INTO\000\
  VALUES\000\
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
  INTEGER\000\
  VARCHAR\000\
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
# 44 "sqlparse.mly"
                      (_2)
# 227 "sqlparse.ml"
               : Sqlast.simple_query))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_query) in
    Obj.repr(
# 45 "sqlparse.mly"
                              (_1)
# 234 "sqlparse.ml"
               : Sqlast.simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'projection) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'where) in
    Obj.repr(
# 50 "sqlparse.mly"
                                         ( Squery (_2, _4 ,_5))
# 243 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'col_list) in
    Obj.repr(
# 51 "sqlparse.mly"
                                  ( Cquery(_3, _4))
# 251 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'source) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'val_list) in
    Obj.repr(
# 52 "sqlparse.mly"
                                        (Iquery(_3, _5))
# 259 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 55 "sqlparse.mly"
                     (_2)
# 266 "sqlparse.ml"
               : 'where))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "sqlparse.mly"
                ( Asterix )
# 272 "sqlparse.ml"
               : 'projection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'projection_bis) in
    Obj.repr(
# 59 "sqlparse.mly"
                        (Pro _1)
# 279 "sqlparse.ml"
               : 'projection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'column) in
    Obj.repr(
# 62 "sqlparse.mly"
                (Col _1)
# 286 "sqlparse.ml"
               : 'projection_bis))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'column) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'projection_bis) in
    Obj.repr(
# 63 "sqlparse.mly"
                                     (Col2 (_1 ,_3))
# 294 "sqlparse.ml"
               : 'projection_bis))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 66 "sqlparse.mly"
                             ( Ex _1  )
# 301 "sqlparse.ml"
               : 'column))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 67 "sqlparse.mly"
                             ( ExID (_1 , _3) )
# 309 "sqlparse.ml"
               : 'column))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 71 "sqlparse.mly"
         ( ID _1)
# 316 "sqlparse.ml"
               : 'col))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "sqlparse.mly"
      ([])
# 322 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'col) in
    Obj.repr(
# 76 "sqlparse.mly"
         ( [_1] )
# 329 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'col) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'col_list) in
    Obj.repr(
# 77 "sqlparse.mly"
                        ( _1 :: _3 )
# 337 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 81 "sqlparse.mly"
               ( ID _1 )
# 344 "sqlparse.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'predicate) in
    Obj.repr(
# 87 "sqlparse.mly"
                       ( Pred _1 )
# 351 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 88 "sqlparse.mly"
                        ( Not _2 )
# 358 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'condition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 89 "sqlparse.mly"
                             ( And (_1 , _3) )
# 366 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'condition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 90 "sqlparse.mly"
                            ( Or (_1 , _3) )
# 374 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'condition) in
    Obj.repr(
# 95 "sqlparse.mly"
                         ( Par _2 )
# 381 "sqlparse.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'sep) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "sqlparse.mly"
                         ( Sep (_1 , _3 , _2) )
# 390 "sqlparse.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    Obj.repr(
# 99 "sqlparse.mly"
             ( Eq )
# 396 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 100 "sqlparse.mly"
                ( Lt )
# 402 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 101 "sqlparse.mly"
               ( Gt )
# 408 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "sqlparse.mly"
                     ( Le )
# 414 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "sqlparse.mly"
                    ( Ge )
# 420 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 106 "sqlparse.mly"
                    ( Att _1 )
# 427 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 107 "sqlparse.mly"
                    ( Parexp _2 )
# 434 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 108 "sqlparse.mly"
                    ( Int _1 )
# 441 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 109 "sqlparse.mly"
                    ( Float _1 )
# 448 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 110 "sqlparse.mly"
                   ( String _1 )
# 455 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "sqlparse.mly"
                    ( Ope (_1 , _3 , Plus) )
# 463 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "sqlparse.mly"
                     ( Ope (_1 , _3 , Minus) )
# 471 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "sqlparse.mly"
                    ( Ope (_1 , _3 , Astrix) )
# 479 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "sqlparse.mly"
                      ( Ope (_1 , _3 , Slash) )
# 487 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 117 "sqlparse.mly"
      ([])
# 493 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "sqlparse.mly"
          ( [_1])
# 500 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'val_list) in
    Obj.repr(
# 119 "sqlparse.mly"
                         (_1 :: _3)
# 508 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 123 "sqlparse.mly"
               ( Dot (_1 , _3))
# 516 "sqlparse.ml"
               : 'attribute))
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
