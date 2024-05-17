type simple_query = 
  |Squery of projection * source * condition


  and projection = 
    |Asterix 
    |Pro of projection_bis
  
  and projection_bis = 
    |Col of column
    |Col2 of column * projection_bis

  and column = 
    |Ex of expr
    |ExID of expr * string
  
  and source = 
    |ID of string 

  and condition = 
    |Pred of predicate
    |Not of condition
    |And of condition * condition
    |Or of condition * condition
 

  and predicate = 
    |Par of condition
    |Sep of expr * expr * sep
  
  and sep = 
    |Eq
    |Neq
    |Lt 
    |Gt 
    |Le 
    |Ge 

  and expr = 
    |Att of attribute
    |Parexp of expr
    |Int of int 
    |Float of float
    |String of string 
    |Ope of expr * expr * operation

  and attribute = 
    |Dot of string * string

  and operation = 
    |Plus
    |Minus
    |Slash
    |Astrix
