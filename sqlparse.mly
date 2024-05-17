%{

open Sqlast

%}


/* Déclaration des terminaux */

%token <int> INT 
%token <string> STRING 
%token <string> ID
%token <float> FLOAT
%token SELECT FROM WHERE
%token AND OR NOT
%token PLUS MINUS STAR DIVIDE
%token LPAR RPAR
%token EQUAL COMMA DOT
%token GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%token SEMICOLON
%token AS

%left FROM
%left WHERE
%left SELECT
%left COMMA
%left EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%left PLUS MINUS
%left STAR DIVIDE
%left OR
%left AND
%left NOT


%start main
%type <Sqlast.simple_query> main

/* La grammaire */

%%

main:
    |SEMICOLON main   {$2}
    |simple_query SEMICOLON   {$1}
;

simple_query:
    |SELECT projection FROM source where { Squery ($2, $4 ,$5)}
;   
where:
    |WHERE condition {$2}
;
projection:
    |STAR       { Asterix }
    |projection_bis     {Pro $1}
;
projection_bis:
    |column     {Col $1}
    |column COMMA projection_bis     {Col2 ($1 ,$3)}
;
column: 
    |expr                    { Ex $1  }
    |expr AS ID              { ExID ($1 , $3) }
;
source: 
    |ID 					  { ID $1 }
//     |LPAR simple_query RPAR   { squery $2 }
    // |source COMA source     { comma $1 $3 }

;
condition:
    |predicate         { Pred $1 }
    |NOT condition      { Not $2 }
    |condition AND condition { And ($1 , $3) }
    |condition OR condition { Or ($1 , $3) }
;


predicate:
    |LPAR condition RPAR { Par $2 }
    |expr sep expr       { Sep ($1 , $3 , $2) }
 ;                          
sep:
    |EQUAL   { Eq }
    |SMALLER    { Lt }
    |GREATER   { Gt }
    |SMALLEREQUAL    { Le }
    |GREATEREQUAL   { Ge }
; 
expr :
    |attribute      { Att $1 }
    |LPAR expr RPAR { Parexp $2 }
    |INT            { Int $1 }
    |FLOAT          { Float $1 }
    |STRING         { String $1 }
    |expr operation expr { Ope ($1 , $3 , $2) }

;
attribute:
    |ID DOT ID { Dot ($1 , $3)}
;
operation:
    |PLUS      { Plus }
    |MINUS     { Minus }
    |STAR      { Astrix }
    |DIVIDE    { Slash }
;