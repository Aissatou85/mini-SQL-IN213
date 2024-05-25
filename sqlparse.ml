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

# 44 "sqlparse.ml"
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
  271 (* AND *);
  272 (* OR *);
  273 (* NOT *);
  274 (* PLUS *);
  275 (* MINUS *);
  276 (* STAR *);
  277 (* DIVIDE *);
  278 (* LPAR *);
  279 (* RPAR *);
  280 (* EQUAL *);
  281 (* COMMA *);
  282 (* DOT *);
  283 (* GREATER *);
  284 (* SMALLER *);
  285 (* GREATEREQUAL *);
  286 (* SMALLEREQUAL *);
  287 (* SEMICOLON *);
  288 (* AS *);
  289 (* INTEGER *);
  290 (* VARCHAR *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* STRING *);
  259 (* ID *);
  260 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\005\000\003\000\
\003\000\010\000\010\000\011\000\011\000\013\000\006\000\006\000\
\006\000\004\000\008\000\009\000\009\000\009\000\009\000\014\000\
\014\000\015\000\015\000\015\000\015\000\015\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\007\000\
\007\000\007\000\016\000\000\000"

let yylen = "\002\000\
\002\000\002\000\005\000\004\000\005\000\005\000\002\000\001\000\
\001\000\001\000\003\000\001\000\003\000\001\000\000\000\001\000\
\003\000\001\000\003\000\001\000\002\000\003\000\003\000\003\000\
\003\000\001\000\001\000\001\000\001\000\001\000\001\000\003\000\
\001\000\001\000\001\000\003\000\003\000\003\000\003\000\000\000\
\001\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\044\000\
\000\000\033\000\035\000\000\000\034\000\008\000\000\000\000\000\
\009\000\000\000\000\000\031\000\000\000\000\000\018\000\000\000\
\001\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\043\000\032\000\
\000\000\011\000\000\000\000\000\038\000\039\000\013\000\014\000\
\004\000\000\000\000\000\000\000\000\000\000\000\003\000\000\000\
\005\000\000\000\006\000\000\000\000\000\000\000\000\000\000\000\
\020\000\017\000\000\000\000\000\021\000\000\000\000\000\000\000\
\000\000\026\000\028\000\027\000\030\000\029\000\000\000\042\000\
\024\000\022\000\000\000\000\000"

let yydgoto = "\002\000\
\008\000\009\000\016\000\024\000\055\000\049\000\057\000\052\000\
\063\000\017\000\018\000\064\000\050\000\065\000\079\000\020\000"

let yysindex = "\004\000\
\001\255\000\000\000\255\004\255\255\254\034\255\001\255\000\000\
\246\254\000\000\000\000\017\255\000\000\000\000\014\255\041\255\
\000\000\015\255\033\255\000\000\034\255\034\255\000\000\044\255\
\000\000\000\000\059\255\130\255\034\255\014\255\014\255\014\255\
\014\255\014\255\060\255\065\255\062\255\065\255\000\000\000\000\
\064\255\000\000\243\254\243\254\000\000\000\000\000\000\000\000\
\000\000\050\255\014\255\064\255\056\255\022\255\000\000\065\255\
\000\000\122\255\000\000\014\255\022\255\022\255\030\255\109\255\
\000\000\000\000\014\255\136\255\000\000\075\255\096\255\022\255\
\022\255\000\000\000\000\000\000\000\000\000\000\014\255\000\000\
\000\000\000\000\074\255\136\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\086\255\013\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\071\255\000\000\000\000\000\000\000\000\
\000\000\000\000\054\255\081\255\000\000\000\000\000\000\000\000\
\000\000\072\255\076\255\000\000\000\000\000\000\000\000\071\255\
\000\000\087\255\000\000\000\000\000\000\000\000\090\255\000\000\
\000\000\000\000\076\255\088\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\019\255\018\255"

let yygindex = "\000\000\
\115\000\000\000\000\000\072\000\079\000\076\000\067\000\000\000\
\250\255\105\000\000\000\253\255\106\000\000\000\000\000\000\000"

let yytablesize = 157
let yytable = "\019\000\
\010\000\011\000\012\000\013\000\001\000\003\000\033\000\034\000\
\004\000\022\000\005\000\028\000\021\000\006\000\010\000\011\000\
\012\000\013\000\012\000\014\000\026\000\015\000\010\000\011\000\
\012\000\013\000\019\000\043\000\044\000\045\000\046\000\007\000\
\025\000\025\000\023\000\015\000\023\000\012\000\061\000\030\000\
\025\000\023\000\027\000\062\000\072\000\073\000\029\000\058\000\
\025\000\023\000\031\000\032\000\033\000\034\000\069\000\070\000\
\068\000\038\000\071\000\036\000\036\000\039\000\047\000\058\000\
\035\000\082\000\083\000\048\000\036\000\036\000\054\000\036\000\
\036\000\051\000\056\000\084\000\036\000\036\000\036\000\060\000\
\036\000\036\000\036\000\036\000\036\000\036\000\037\000\037\000\
\072\000\072\000\073\000\010\000\036\000\037\000\019\000\037\000\
\037\000\081\000\037\000\037\000\041\000\015\000\016\000\037\000\
\037\000\037\000\040\000\037\000\037\000\037\000\037\000\037\000\
\037\000\031\000\032\000\033\000\034\000\041\000\040\000\074\000\
\007\000\025\000\075\000\076\000\077\000\078\000\031\000\032\000\
\033\000\034\000\059\000\066\000\074\000\080\000\042\000\075\000\
\076\000\077\000\078\000\031\000\032\000\033\000\034\000\053\000\
\000\000\000\000\067\000\031\000\032\000\033\000\034\000\000\000\
\040\000\031\000\032\000\033\000\034\000"

let yycheck = "\003\000\
\001\001\002\001\003\001\004\001\001\000\005\001\020\001\021\001\
\008\001\011\001\010\001\015\000\009\001\013\001\001\001\002\001\
\003\001\004\001\006\001\020\001\031\001\022\001\001\001\002\001\
\003\001\004\001\030\000\031\000\032\000\033\000\034\000\031\001\
\015\001\016\001\016\001\022\001\003\001\025\001\017\001\025\001\
\023\001\023\001\026\001\022\001\015\001\016\001\006\001\051\000\
\031\001\031\001\018\001\019\001\020\001\021\001\061\000\062\000\
\060\000\014\001\062\000\006\001\007\001\003\001\003\001\067\000\
\032\001\072\000\073\000\003\001\015\001\016\001\007\001\018\001\
\019\001\012\001\025\001\079\000\023\001\024\001\025\001\024\001\
\027\001\028\001\029\001\030\001\031\001\032\001\006\001\007\001\
\015\001\015\001\016\001\006\001\021\000\022\000\007\001\015\001\
\016\001\023\001\018\001\019\001\029\000\031\001\031\001\023\001\
\024\001\025\001\031\001\027\001\028\001\029\001\030\001\031\001\
\032\001\018\001\019\001\020\001\021\001\031\001\023\001\024\001\
\031\001\007\000\027\001\028\001\029\001\030\001\018\001\019\001\
\020\001\021\001\052\000\056\000\024\001\067\000\030\000\027\001\
\028\001\029\001\030\001\018\001\019\001\020\001\021\001\038\000\
\255\255\255\255\025\001\018\001\019\001\020\001\021\001\255\255\
\023\001\018\001\019\001\020\001\021\001"

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
# 240 "sqlparse.ml"
               : Sqlast.simple_query))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_query) in
    Obj.repr(
# 46 "sqlparse.mly"
                              (_1)
# 247 "sqlparse.ml"
               : Sqlast.simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'projection) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'where) in
    Obj.repr(
# 51 "sqlparse.mly"
                                         ( Squery (_2, _4 ,_5))
# 256 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'source) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'col_list) in
    Obj.repr(
# 52 "sqlparse.mly"
                                  ( Cquery(_3, _4))
# 264 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'source) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'val_list) in
    Obj.repr(
# 53 "sqlparse.mly"
                                        (Iquery(_3, _5))
# 272 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'source) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'change) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'where) in
    Obj.repr(
# 54 "sqlparse.mly"
                                    (Uquery(_2, _4, _5))
# 281 "sqlparse.ml"
               : 'simple_query))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 57 "sqlparse.mly"
                     (_2)
# 288 "sqlparse.ml"
               : 'where))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "sqlparse.mly"
                ( Asterix )
# 294 "sqlparse.ml"
               : 'projection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'projection_bis) in
    Obj.repr(
# 61 "sqlparse.mly"
                        (Pro _1)
# 301 "sqlparse.ml"
               : 'projection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'column) in
    Obj.repr(
# 64 "sqlparse.mly"
                (Col _1)
# 308 "sqlparse.ml"
               : 'projection_bis))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'column) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'projection_bis) in
    Obj.repr(
# 65 "sqlparse.mly"
                                     (Col2 (_1 ,_3))
# 316 "sqlparse.ml"
               : 'projection_bis))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 68 "sqlparse.mly"
                             ( Ex _1  )
# 323 "sqlparse.ml"
               : 'column))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "sqlparse.mly"
                             ( ExID (_1 , _3) )
# 331 "sqlparse.ml"
               : 'column))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 73 "sqlparse.mly"
         ( ID _1)
# 338 "sqlparse.ml"
               : 'col))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "sqlparse.mly"
      ([])
# 344 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'col) in
    Obj.repr(
# 78 "sqlparse.mly"
         ( [_1] )
# 351 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'col) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'col_list) in
    Obj.repr(
# 79 "sqlparse.mly"
                        ( _1 :: _3 )
# 359 "sqlparse.ml"
               : 'col_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 83 "sqlparse.mly"
               ( ID _1 )
# 366 "sqlparse.ml"
               : 'source))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'col) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "sqlparse.mly"
                    (Ch ( _1, _3))
# 374 "sqlparse.ml"
               : 'change))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'predicate) in
    Obj.repr(
# 94 "sqlparse.mly"
                       ( Pred _1 )
# 381 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 95 "sqlparse.mly"
                        ( Not _2 )
# 388 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'condition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 96 "sqlparse.mly"
                             ( And (_1 , _3) )
# 396 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'condition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'condition) in
    Obj.repr(
# 97 "sqlparse.mly"
                            ( Or (_1 , _3) )
# 404 "sqlparse.ml"
               : 'condition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'condition) in
    Obj.repr(
# 102 "sqlparse.mly"
                         ( Par _2 )
# 411 "sqlparse.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'sep) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "sqlparse.mly"
                         ( Sep (_1 , _3 , _2) )
# 420 "sqlparse.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "sqlparse.mly"
             ( Eq )
# 426 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "sqlparse.mly"
                ( Lt )
# 432 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 108 "sqlparse.mly"
               ( Gt )
# 438 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 109 "sqlparse.mly"
                     ( Le )
# 444 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "sqlparse.mly"
                    ( Ge )
# 450 "sqlparse.ml"
               : 'sep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 113 "sqlparse.mly"
                    ( Att _1 )
# 457 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 114 "sqlparse.mly"
                    ( Parexp _2 )
# 464 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 115 "sqlparse.mly"
                    ( Int _1 )
# 471 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 116 "sqlparse.mly"
                    ( Float _1 )
# 478 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 117 "sqlparse.mly"
                   ( String _1 )
# 485 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "sqlparse.mly"
                    ( Ope (_1 , _3 , Plus) )
# 493 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "sqlparse.mly"
                     ( Ope (_1 , _3 , Minus) )
# 501 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "sqlparse.mly"
                    ( Ope (_1 , _3 , Astrix) )
# 509 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "sqlparse.mly"
                      ( Ope (_1 , _3 , Slash) )
# 517 "sqlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 124 "sqlparse.mly"
      ([])
# 523 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "sqlparse.mly"
          ( [_1])
# 530 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'val_list) in
    Obj.repr(
# 126 "sqlparse.mly"
                         (_1 :: _3)
# 538 "sqlparse.ml"
               : 'val_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 130 "sqlparse.mly"
               ( Dot (_1 , _3))
# 546 "sqlparse.ml"
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
