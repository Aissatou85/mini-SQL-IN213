type simple_query = 
  |Squery of projection * source * condition
  |Cquery of source * col_list
  |Iquery of source * val_list 
  |Uquery of source * change * condition
  |Dquery of source * condition
  |Drquery of source

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
 
  and change = 
    |Ch of col * expr

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
    
  and val_list= expr list 

  and col = 
    | ID of string

  and col_list = col list 
  
  and attribute = 
    |Dot of string * string

  and operation = 
    |Plus
    |Minus
    |Slash
    |Astrix

    open Printf

    let rec print_query oc = function
      | Squery (proj, src, cond) ->
          fprintf oc "SELECT %a FROM %a WHERE %a"
            print_projection proj
            print_source src
            print_condition cond
      | Cquery (src, cols)  ->
              fprintf oc "CREATE TABLE %a %a" 
                print_source src
                print_col_list cols
      | Iquery (src, vals) ->
              fprintf oc "INSERT INTO %a VALUES (%a)"
                print_source src
                print_val_list vals
      | Uquery (src, ch, cond) ->
        fprintf oc "UPDATE %a SET %a WHERE %a"
        print_source src
        print_change ch
        print_condition cond
      | Dquery (src, cond) -> 
        fprintf oc "DELETE FROM %a WHERE %a"
        print_source src
        print_condition cond
      | Drquery (src) ->
        fprintf oc "DELETE TABLE %a"
        print_source src
    
    and print_projection oc = function
      | Asterix -> fprintf oc "*"
      | Pro proj_bis -> print_projection_bis oc proj_bis
    
    and print_projection_bis oc = function
      | Col col -> print_column oc col
      | Col2 (col, proj_bis) ->
          fprintf oc "%a, %a" print_column col print_projection_bis proj_bis
    
    and print_column oc = function
      | Ex expr -> print_expr oc expr
      | ExID (expr, id) -> fprintf oc "%a AS %s" print_expr expr id
    
    and print_source oc = function
      | ID id -> fprintf oc "%s" id
    
    and print_condition oc = function
      | Pred pred -> print_predicate oc pred
      | Not cond -> fprintf oc "NOT %a" print_condition cond
      | And (cond1, cond2) -> fprintf oc "%a AND %a" print_condition cond1 print_condition cond2
      | Or (cond1, cond2) -> fprintf oc "%a OR %a" print_condition cond1 print_condition cond2
    
    and print_predicate oc = function
      | Par cond -> fprintf oc "(%a)" print_condition cond
      | Sep (expr1, expr2, sep) -> fprintf oc "%a %a %a" print_expr expr1 print_sep sep print_expr expr2
    
    and print_change oc = function
        |Ch (col, expr) -> fprintf oc "%a = %a" print_col_def col print_expr expr
    
    and print_sep oc = function
      | Eq -> fprintf oc "="
      | Neq -> fprintf oc "<>"
      | Lt -> fprintf oc "<"
      | Gt -> fprintf oc ">"
      | Le -> fprintf oc "<="
      | Ge -> fprintf oc ">="
    
    and print_expr oc = function
      | Att attr -> print_attribute oc attr
      | Parexp expr -> fprintf oc "(%a)" print_expr expr
      | Int n -> fprintf oc "%d" n
      | Float f -> fprintf oc "%f" f
      | String s -> fprintf oc "%s" s
      | Ope (expr1, expr2, op) -> fprintf oc "%a %a %a" print_expr expr1 print_operation op print_expr expr2

   and print_val_list oc = function
  | [] -> ()
  | [v] -> print_expr oc v
  |v :: vs -> 
      fprintf oc "%a, %a" print_expr v print_val_list  vs

   and print_col_list oc = function
   | [] -> failwith "can't create a table without column"
   | [v] -> print_col_def oc v
   | v :: vs -> 
    fprintf oc "%a, %a" print_col_def v print_col_list  vs
  
    and print_col_def oc = function
    | ID id -> fprintf oc "%s" id
    
    and print_attribute oc = function
      | Dot (str1, str2) -> fprintf oc "%s.%s" str1 str2
    
    and print_operation oc = function
      | Plus -> fprintf oc "+"
      | Minus -> fprintf oc "-"
      | Slash -> fprintf oc "/"
      | Astrix -> fprintf oc "*"
    
    
  