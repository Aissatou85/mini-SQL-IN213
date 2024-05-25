%{

open Sqlast

%}


/* Déclaration des terminaux */

%token <int> INT 
%token <string> STRING 
%token <string> ID
%token <float> FLOAT
%token SELECT FROM WHERE CREATE TABLE INSERT INTO VALUES UPDATE SET DELETE DROP
%token AND OR NOT
%token PLUS MINUS STAR DIVIDE
%token LPAR RPAR
%token EQUAL COMMA DOT
%token GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%token SEMICOLON
%token AS
%token INTEGER
%token VARCHAR 


%left FROM VALUES
%left WHERE TABLE INTO
%left SET 
%left SELECT INSERT CREATE UPDATE DELETE DROP
%left COMMA
%left EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%left PLUS MINUS OR 
%left STAR DIVIDE AND
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
    |CREATE TABLE source col_list { Cquery($3, $4)}
    |INSERT INTO source VALUES val_list {Iquery($3, $5)}
    |UPDATE source SET change where {Uquery($2, $4, $5)}
    |DELETE FROM source where { Dquery($3, $4)}
    |DROP TABLE source {Drquery($3)}
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

col:
    | ID { ID $1}
;

col_list:
    | {[]}
    |col { [$1] }
    |col COMMA col_list { $1 :: $3 }
 ;

source: 
    |ID 					  { ID $1 }

;

change:
    |col EQUAL expr {Ch ( $1, $3)}
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
    |STRING        { String $1 }
    |expr PLUS expr { Ope ($1 , $3 , Plus) }
    |expr MINUS expr { Ope ($1 , $3 , Minus) }
    |expr STAR expr { Ope ($1 , $3 , Astrix) }
    |expr DIVIDE expr { Ope ($1 , $3 , Slash) }
;
val_list:
    | {[]}
    |expr { [$1]}
    |expr COMMA val_list {$1 :: $3}

;
attribute:
    |ID DOT ID { Dot ($1 , $3)}
;
