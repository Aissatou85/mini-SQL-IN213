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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Sqlast.simple_query
