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
  | UPDATE
  | SET
  | DELETE
  | DROP
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

# 46 "sqlparse.ml"
let yytransl_const = [|
  261 (* SELECT *);
  262 (* FROM *);
  263 (* WHERE *);
  264 (* CREATE *);
  265 (* TABLE *);
  266 (* INSERT *);
  267 (* INTO *);
  268 (* VALUES *);
  269 (* UPDATE *);
  270 (* SET *);
  271 (* DELETE *);
  272 (* DROP *);
  273 (* AND *);
  274 (* OR *);
  275 (* NOT *);
  276 (* PLUS *);
  277 (* MINUS *);
  278 (* STAR *);
  279 (* DIVIDE *);
  280 (* LPAR *);
  281 (* RPAR *);
  282 (* EQUAL *);
  283 (* COMMA *);
  284 (* DOT *);
  285 (* GREATER *);
  286 (* SMALLER *);
  287 (* GREATEREQUAL *);
  288 (* SMALLEREQUAL *);
  289 (* SEMICOLON *);
  290 (* AS *);
  291 (* INTEGER *);
  292 (* VARCHAR *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* STRING *);
  259 (* ID *);
  260 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\002\000\002\000\
\005\000\003\000\003\000\010\000\010\000\011\000\011\000\013\000\
\006\000\006\000\006\000\004\000\008\000\009\000\009\000\009\000\
\009\000\014\000\014\000\015\000\015\000\015\000\015\000\015\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\007\000\007\000\007\000\016\000\000\000"

let yylen = "\002\000\
\002\000\002\000\005\000\004\000\005\000\005\000\004\000\003\000\
\002\000\001\000\001\000\001\000\003\000\001\000\003\000\001\000\
\000\000\001\000\003\000\001\000\003\000\001\000\002\000\003\000\
\003\000\003\000\003\000\001\000\001\000\001\000\001\000\001\000\
\001\000\003\000\001\000\001\000\001\000\003\000\003\000\003\000\
\003\000\000\000\001\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\046\000\000\000\035\000\037\000\000\000\036\000\010\000\
\000\000\000\000\011\000\000\000\000\000\033\000\000\000\000\000\
\020\000\000\000\000\000\000\000\001\000\002\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\008\000\045\000\034\000\000\000\013\000\
\000\000\000\000\040\000\041\000\015\000\016\000\004\000\000\000\
\000\000\000\000\000\000\000\000\007\000\003\000\000\000\005\000\
\000\000\006\000\000\000\000\000\000\000\000\000\000\000\022\000\
\019\000\000\000\000\000\023\000\000\000\000\000\000\000\000\000\
\028\000\030\000\029\000\032\000\031\000\000\000\044\000\026\000\
\024\000\000\000\000\000"

let yydgoto = "\002\000\
\010\000\011\000\018\000\026\000\061\000\055\000\064\000\058\000\
\070\000\019\000\020\000\071\000\056\000\072\000\086\000\022\000"

let yysindex = "\017\000\
\032\255\000\000\089\255\014\255\030\255\041\255\040\255\043\255\
\032\255\000\000\016\255\000\000\000\000\025\255\000\000\000\000\
\006\255\057\255\000\000\047\255\035\255\000\000\041\255\041\255\
\000\000\056\255\041\255\041\255\000\000\000\000\074\255\125\255\
\041\255\006\255\006\255\006\255\006\255\006\255\099\255\102\255\
\094\255\102\255\109\255\000\000\000\000\000\000\109\255\000\000\
\239\254\239\254\000\000\000\000\000\000\000\000\000\000\096\255\
\006\255\109\255\100\255\093\255\000\000\000\000\102\255\000\000\
\117\255\000\000\006\255\093\255\093\255\042\255\098\255\000\000\
\000\000\006\255\131\255\000\000\097\255\078\255\093\255\093\255\
\000\000\000\000\000\000\000\000\000\000\006\255\000\000\000\000\
\000\000\108\255\131\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\127\255\011\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\101\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\251\254\055\255\000\000\000\000\000\000\000\000\000\000\110\255\
\116\255\000\000\000\000\000\000\000\000\000\000\101\255\000\000\
\122\255\000\000\000\000\000\000\000\000\123\255\000\000\000\000\
\000\000\116\255\135\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\018\255\242\254"

let yygindex = "\000\000\
\148\000\000\000\000\000\108\000\248\255\095\000\085\000\000\000\
\255\255\126\000\000\000\253\255\119\000\000\000\000\000\000\000"

let yytablesize = 161
let yytable = "\021\000\
\038\000\038\000\027\000\027\000\037\000\038\000\012\000\013\000\
\014\000\015\000\027\000\038\000\038\000\032\000\038\000\038\000\
\014\000\001\000\027\000\038\000\038\000\038\000\023\000\038\000\
\038\000\038\000\038\000\038\000\038\000\017\000\021\000\049\000\
\050\000\051\000\052\000\025\000\003\000\014\000\062\000\004\000\
\024\000\005\000\025\000\025\000\006\000\027\000\007\000\008\000\
\030\000\066\000\025\000\028\000\031\000\065\000\035\000\036\000\
\037\000\038\000\079\000\080\000\039\000\039\000\033\000\075\000\
\009\000\078\000\076\000\077\000\039\000\042\000\065\000\039\000\
\039\000\034\000\039\000\039\000\045\000\089\000\090\000\039\000\
\039\000\039\000\091\000\039\000\039\000\039\000\039\000\039\000\
\039\000\012\000\013\000\014\000\015\000\012\000\013\000\014\000\
\015\000\035\000\036\000\037\000\038\000\053\000\046\000\081\000\
\054\000\057\000\082\000\083\000\084\000\085\000\016\000\068\000\
\017\000\079\000\080\000\060\000\069\000\035\000\036\000\037\000\
\038\000\088\000\063\000\081\000\079\000\067\000\082\000\083\000\
\084\000\085\000\040\000\041\000\012\000\017\000\043\000\044\000\
\035\000\036\000\037\000\038\000\047\000\021\000\018\000\074\000\
\035\000\036\000\037\000\038\000\042\000\046\000\035\000\036\000\
\037\000\038\000\043\000\009\000\029\000\073\000\087\000\048\000\
\059\000"

let yycheck = "\003\000\
\006\001\007\001\017\001\018\001\022\001\023\001\001\001\002\001\
\003\001\004\001\025\001\017\001\018\001\017\000\020\001\021\001\
\006\001\001\000\033\001\025\001\026\001\027\001\009\001\029\001\
\030\001\031\001\032\001\033\001\034\001\024\001\034\000\035\000\
\036\000\037\000\038\000\018\001\005\001\027\001\047\000\008\001\
\011\001\010\001\025\001\003\001\013\001\006\001\015\001\016\001\
\033\001\058\000\033\001\009\001\028\001\057\000\020\001\021\001\
\022\001\023\001\017\001\018\001\006\001\007\001\006\001\067\000\
\033\001\069\000\068\000\069\000\034\001\014\001\074\000\017\001\
\018\001\027\001\020\001\021\001\003\001\079\000\080\000\025\001\
\026\001\027\001\086\000\029\001\030\001\031\001\032\001\033\001\
\034\001\001\001\002\001\003\001\004\001\001\001\002\001\003\001\
\004\001\020\001\021\001\022\001\023\001\003\001\025\001\026\001\
\003\001\012\001\029\001\030\001\031\001\032\001\022\001\019\001\
\024\001\017\001\018\001\007\001\024\001\020\001\021\001\022\001\
\023\001\025\001\027\001\026\001\017\001\026\001\029\001\030\001\
\031\001\032\001\023\000\024\000\006\001\033\001\027\000\028\000\
\020\001\021\001\022\001\023\001\033\000\007\001\033\001\027\001\
\020\001\021\001\022\001\023\001\033\001\025\001\020\001\021\001\
\022\001\023\001\033\001\033\001\009\000\063\000\074\000\034\000\
\042\000"

let yynames_const = "\
  SELECT\000\
  FROM\000\
  WHERE\000\
  CREATE\000\
  TABLE\000\
  INSERT\000\
  INTO\000\
  VALUES\000\
  UPDATE\000\
  SET\000\
  DELETE\000\
  DROP\000\
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
# 45 "sqlparse.mly"
                      (_2)
# 251 "sqlparse.ml"
               : Sqlast.simple_query))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_query) in
    Obj.repr(
# 46 "sqlparse.mly"
                              (_1)
# 258 "sqlparse.ml"
               : Sqlast.simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'projection) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'where) in
    Obj.repr(
# 51 "sqlparse.mly"
                                         ( Squery (_2, _4 ,_5))
# 267 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'col_list) in
    Obj.repr(
# 52 "sqlparse.mly"
                                  ( Cquery(_3, _4))
# 275 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'source) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'val_list) in
    Obj.repr(
# 53 "sqlparse.mly"
                                        (Iquery(_3, _5))
# 283 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'source) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'change) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'where) in
    Obj.repr(
# 54 "sqlparse.mly"
                                    (Uquery(_2, _4, _5))
# 292 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'where) in
    Obj.repr(
# 55 "sqlparse.mly"
                              ( Dquery(_3, _4))
# 300 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'source) in
    Obj.repr(
# 56 "sqlparse.mly"
                       (Drquery(_3))
# 307 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 59 "sqlparse.mly"
                     (_2)
# 314 "sqlparse.ml"
               : 'where))
; (fun __caml_parser_env ->
    Obj.repr(
# 62 "sqlparse.mly"
                ( Asterix )
# 320 "sqlparse.ml"
               : 'projection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'projection_bis) in
    Obj.repr(
# 63 "sqlparse.mly"
                        (Pro _1)
# 327 "sqlparse.ml"
               : 'projection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'column) in
    Obj.repr(
# 66 "sqlparse.mly"
                (Col _1)
# 334 "sqlparse.ml"
               : 'projection_bis))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'column) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'projection_bis) in
    Obj.repr(
# 67 "sqlparse.mly"
                                     (Col2 (_1 ,_3))
# 342 "sqlparse.ml"
               : 'projection_bis))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "sqlparse.mly"
                             ( Ex _1  )
# 349 "sqlparse.ml"
               : 'column))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 71 "sqlparse.mly"
                             ( ExID (_1 , _3) )
# 357 "sqlparse.ml"
               : 'column))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 75 "sqlparse.mly"
         ( ID _1)
# 364 "sqlparse.ml"
               : 'col))
; (fun __caml_parser_env ->
    Obj.repr(
# 79 "sqlparse.mly"
      ([])
# 370 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'col) in
    Obj.repr(
# 80 "sqlparse.mly"
         ( [_1] )
# 377 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'col) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'col_list) in
    Obj.repr(
# 81 "sqlparse.mly"
                        ( _1 :: _3 )
# 385 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "sqlparse.mly"
               ( ID _1 )
# 392 "sqlparse.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'col) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "sqlparse.mly"
                    (Ch ( _1, _3))
# 400 "sqlparse.ml"
               : 'change))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'predicate) in
    Obj.repr(
# 94 "sqlparse.mly"
                       ( Pred _1 )
# 407 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 95 "sqlparse.mly"
                        ( Not _2 )
# 414 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'condition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 96 "sqlparse.mly"
                             ( And (_1 , _3) )
# 422 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'condition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 97 "sqlparse.mly"
                            ( Or (_1 , _3) )
# 430 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'condition) in
    Obj.repr(
# 102 "sqlparse.mly"
                         ( Par _2 )
# 437 "sqlparse.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'sep) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "sqlparse.mly"
                         ( Sep (_1 , _3 , _2) )
# 446 "sqlparse.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "sqlparse.mly"
             ( Eq )
# 452 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "sqlparse.mly"
                ( Lt )
# 458 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 108 "sqlparse.mly"
               ( Gt )
# 464 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 109 "sqlparse.mly"
                     ( Le )
# 470 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "sqlparse.mly"
                    ( Ge )
# 476 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 113 "sqlparse.mly"
                    ( Att _1 )
# 483 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 114 "sqlparse.mly"
                    ( Parexp _2 )
# 490 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 115 "sqlparse.mly"
                    ( Int _1 )
# 497 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 116 "sqlparse.mly"
                    ( Float _1 )
# 504 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 117 "sqlparse.mly"
                   ( String _1 )
# 511 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "sqlparse.mly"
                    ( Ope (_1 , _3 , Plus) )
# 519 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "sqlparse.mly"
                     ( Ope (_1 , _3 , Minus) )
# 527 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "sqlparse.mly"
                    ( Ope (_1 , _3 , Astrix) )
# 535 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "sqlparse.mly"
                      ( Ope (_1 , _3 , Slash) )
# 543 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 124 "sqlparse.mly"
      ([])
# 549 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "sqlparse.mly"
          ( [_1])
# 556 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'val_list) in
    Obj.repr(
# 126 "sqlparse.mly"
                         (_1 :: _3)
# 564 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 130 "sqlparse.mly"
               ( Dot (_1 , _3))
# 572 "sqlparse.ml"
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
