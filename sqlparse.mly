%{

open sqlast

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
%type <sqlast.expr> main

/* La grammaire */

%%

main:
    |SEMICOLON main   {$2}
    |expr SEMICOLON   {$1}
;

simple_query:
    |SELECT projection FROM source where { squery $2 $4 $5}
    
where:
    |WHERE conditiopn {$2}

projection:
    |STAR       { asterix }
    |projection_bis     {pro $1}

projection_bis:
    |column     {col $1}
    |column COMA projection_bis     {col2 $1 $3}

column: 
    |expr                    { ex $1 }
    |expr AS ID              { exid $1 $3 }

source: 
    |ID 					  { id $1 }
    |LPAR simple_query RPAR   { squery $2 }
    |source COMA source     { comma $1 $3 }


condition:
    |predicate         { pred $1 }
    |NOT condition      { no $2 }
    |condition AND condition { anD $1 $3 }
    |condition OR condition { oR $1 $3 }



predicate:
    |LPAR condition RPAR { par $2 }
    |expr sep expr       { seP $1 $3 $2 }
                           
sep:
    |EQUAL   { eq }
    |SMALLER    { lt }
    |GREATER   { gt }
    |SMALLEREQUAL    { le }
    |GREATEREQUAL   { ge }

expr :
    |attribute      { att $1 }
    |LPAR expr RPAR { parexp $2 }
    |INT            { inT $1 }
    |FLOAT          { floaT $1 }
    |STRING         { strinG $1 }
    |expr operation expr { ope $1 $3 $2 }


attribute:
    |ID DOT ID { dot $1 $3 }

operation:
    |PLUS      { plus }
    |MINUS     { minus }
    |STAR      { astrix }
    |SLASH     { slash }
