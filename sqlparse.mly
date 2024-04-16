%{

open sqlfast

%}


/* Déclaration des terminaux */

%token <int> INT 
%token <string> STRING 
%token <string> ID
%token <float> FLOAT
%token SELECT FROM WHERE
%token AND OR NOT
%token 