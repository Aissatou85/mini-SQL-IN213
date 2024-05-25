open Sqlast;;

type value = 
  | IntVal of int
  | FloatVal of float
  | StringVal of string

type table = {
  nom : string;
  colnames : string list;  
  records : (value list) list;
}

let database = ref ([] : table list)

type query_result =
  | SelectResult of (string * value) list list
  | CreateTableResult of string
  | InsertIntoResult of string
  | UpdateSetResult of string 

let print_result = function
  | SelectResult results ->
      Printf.printf "Query results:\n";
      List.iter (fun record ->
        List.iter (fun (col, value) ->
          match value with
          | IntVal v -> Printf.printf "%s: %d\n" col v
          | FloatVal v -> Printf.printf "%s: %f\n" col v
          | StringVal v -> Printf.printf "%s: %s\n" col v) record;
        Printf.printf "\n") results;
      Printf.printf "\n%!"
  | CreateTableResult table_name ->
      Printf.printf "Table '%s' created.\n" table_name
  | InsertIntoResult table_name ->
      Printf.printf "Inserted into table '%s'.\n" table_name
  | UpdateSetResult table_name ->
    Printf.printf "Updated table '%s'.\n" table_name

let create_table name colnames =
  let new_table = { nom = name; colnames = colnames; records = [] } in
  database := new_table :: !database

let insert_into_table name values =
  let table = List.find (fun t -> t.nom = name) !database in
  let new_records = values :: table.records in
  let new_table = { table with records = new_records } in
  database := new_table :: List.filter (fun t -> t.nom <> name) !database
  

let findi f lst =
  let rec aux i = function
    | [] -> raise Not_found
    | x::xs -> if f x then i else aux (i + 1) xs
  in aux 0 lst

 

let rec eval_query query =
  match query with
  | Squery (projection, source, condition) ->
      let table_name = eval_source source in
      let table = List.find (fun t -> t.nom = table_name) !database in
      let table_columns = table.colnames in
      let projected_columns = eval_projection projection table_columns in
      if List.for_all (fun col -> List.mem col table_columns) projected_columns then
        let filtered_records = eval_condition condition table.records table.colnames in
        let result = List.map (fun record -> eval_projection_result record projected_columns table.colnames) filtered_records in
        SelectResult result
      else
        failwith "Projection includes columns not present in the table"
  | Cquery (source, col_list) ->
      let table_name = eval_source source in
      let colnames = List.map eval_col col_list  in
      create_table table_name colnames;
      CreateTableResult table_name
  | Iquery (source, val_list) ->
      let table_name = eval_source source in
      let values = List.map eval_value val_list in
      insert_into_table table_name values;
      InsertIntoResult table_name
  | Uquery (source, change, condition) ->
      let table_name = eval_source source in
      let table = List.find (fun t -> t.nom = table_name) !database in
      let colnames = table.colnames in
      let (Ch (col, expr)) = change in
      let col_name = match col with ID col_str -> col_str in
      if List.mem col_name colnames then
        let updated_records = update_records table col_name expr condition in
        let updated_table = { table with records = updated_records } in
        database := updated_table :: List.filter (fun t -> t.nom <> table_name) !database;
        UpdateSetResult table_name
      else
        failwith "Column not found in the table"


and eval_projection projection table_columns =
  match projection with
  | Asterix -> table_columns
  | Pro projection_bis -> eval_projection_bis projection_bis []

and eval_projection_bis proj acc =
  match proj with
  | Col col -> (eval_column col) :: acc
  | Col2 (col, rest) -> eval_projection_bis rest ((eval_column col) :: acc)

and eval_column = function
  | Ex (Att (Dot (_, col_name))) -> col_name
  | ExID (Att (Dot (_, col_name)), _) -> col_name
  | _ -> failwith "Invalid column structure"

and eval_source = function
  | ID table_name -> table_name

and eval_col = function
  | ID col_name -> col_name

and eval_condition condition table_records colnames =
  match condition with
  | Pred pred -> List.filter (fun record -> eval_predicate pred record colnames) table_records
  | Not cond -> List.filter (fun record -> not (eval_condition cond [record] colnames <> [])) table_records
  | And (cond1, cond2) -> 
      let records1 = eval_condition cond1 table_records colnames in
      eval_condition cond2 records1 colnames
  | Or (cond1, cond2) -> 
      let records1 = eval_condition cond1 table_records colnames in
      let records2 = eval_condition cond2 table_records colnames in
      List.concat [records1; records2]

and eval_predicate pred record colnames =
  match pred with
  | Par cond -> eval_condition cond [record] colnames <> []
  | Sep (expr1, expr2, sep) -> eval_comparison expr1 expr2 sep record colnames

and eval_comparison expr1 expr2 sep record colnames =
  let value1 = eval_expr expr1 record colnames in
  let value2 = eval_expr expr2 record colnames in
  match (value1, value2) with
  | (IntVal v1, IntVal v2) -> eval_int_comparison v1 v2 sep
  | (FloatVal v1, FloatVal v2) -> eval_float_comparison v1 v2 sep
  | (StringVal v1, StringVal v2) -> eval_string_comparison v1 v2 sep
  | _ -> false

and eval_int_comparison v1 v2 sep =
  match sep with
  | Eq -> v1 = v2
  | Neq -> v1 <> v2
  | Lt -> v1 < v2
  | Gt -> v1 > v2
  | Le -> v1 <= v2
  | Ge -> v1 >= v2

and eval_float_comparison v1 v2 sep =
  match sep with
  | Eq -> v1 = v2
  | Neq -> v1 <> v2
  | Lt -> v1 < v2
  | Gt -> v1 > v2
  | Le -> v1 <= v2
  | Ge -> v1 >= v2

and eval_string_comparison v1 v2 sep =
  match sep with
  | Eq -> v1 = v2
  | Neq -> v1 <> v2
  | Lt -> v1 < v2
  | Gt -> v1 > v2
  | Le -> v1 <= v2
  | Ge -> v1 >= v2

and eval_expr expr record colnames =
  match expr with
  | Att (Dot (_, col_name)) ->
      let index = findi (fun col -> col = col_name) colnames in
      List.nth record index
  | Parexp expr -> eval_expr expr record colnames
  | Int n -> IntVal n
  | Float f -> FloatVal f
  | String s -> StringVal s
  | Ope (expr1, expr2, op) ->
      let v1 = eval_expr expr1 record colnames in
      let v2 = eval_expr expr2 record colnames in
      eval_operation v1 v2 op

and eval_operation v1 v2 op =
  match (v1, v2, op) with
  | (IntVal i1, IntVal i2, Plus) -> IntVal (i1 + i2)
  | (IntVal i1, IntVal i2, Minus) -> IntVal (i1 - i2)
  | (IntVal i1, IntVal i2, Astrix) -> IntVal (i1 * i2)
  | (IntVal i1, IntVal i2, Slash) -> IntVal (i1 / i2)
  | (FloatVal f1, FloatVal f2, Plus) -> FloatVal (f1 +. f2)
  | (FloatVal f1, FloatVal f2, Minus) -> FloatVal (f1 -. f2)
  | (FloatVal f1, FloatVal f2, Astrix) -> FloatVal (f1 *. f2)
  | (FloatVal f1, FloatVal f2, Slash) -> FloatVal (f1 /. f2)
  | _ -> failwith "Invalid operation"

and eval_projection_result record projected_columns colnames =
  List.map (fun col ->
    let index = findi (fun col_def -> col_def = col) colnames in
    (col, List.nth record index)) projected_columns

and eval_value = function
  | Int n -> IntVal n
  | Float f -> FloatVal f
  | String s -> StringVal s
  | _ -> failwith "Invalid value expression"

and update_records table col_name expr condition =
    let col_index = findi (fun c -> c = col_name) table.colnames in
    List.map (fun record ->
      if eval_condition condition [record] table.colnames <> [] then
        List.mapi (fun i v -> if i = col_index then eval_expr expr record table.colnames else v) record
      else
        record) table.records

let eval e = eval_query e 

