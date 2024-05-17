open Sqlast;;

type record = (string * value) list
and value =
  | IntVal of int
  | FloatVal of float
  | StringVal of string
 

type environment = {
  tables : (string * string list) list;  (* Map table_name -> column_names *)
  records : (string * record list) list;  (* Map table_name -> records *)
}

let init_env = { tables = []; records = [] }  (* Initialisez l'environnement avec les tables disponibles *)

let error msg = raise (Failure msg)

let extend_env_table env table_name column_names =
  { env with tables = (table_name, column_names) :: env.tables }

let extend_env_records env table_name records =
  { env with records = (table_name, records) :: env.records }

let lookup_table_columns table_name env =
  try List.assoc table_name env.tables
  with Not_found -> error ("Table not found: " ^ table_name)

let lookup_table_records table_name env =
  try List.assoc table_name env.records
  with Not_found -> error ("Table records not found: " ^ table_name)

let rec eval_query query env =
  match query with
  | Squery (projection, source, condition) ->
      let table_name = eval_source source in
      let table_columns = lookup_table_columns table_name env in
      let table_records = lookup_table_records table_name env in
      let projected_columns = eval_projection projection table_columns in
      (* Vérifiez si les colonnes projetées sont présentes dans la table *)
      if List.for_all (fun col -> List.mem col table_columns) projected_columns then
        (* Exécutez la condition si elle est présente *)
        let filtered_records = eval_condition condition table_records
        in
        (* Renvoie les résultats projetés après filtrage *)
        List.map (fun record -> eval_projection_result record projected_columns) filtered_records
      else
        error "Projection includes columns not present in the table"
and eval_projection projection table_columns =
  match projection with
  | Asterix -> table_columns  (* Sélectionne toutes les colonnes *)
  | Pro projection_bis -> eval_projection_bis projection_bis []
and eval_projection_bis proj acc =
  match proj with
  | Col (ExID (_, col_name)) -> col_name :: acc
  | Col _ -> failwith "Invalid column structure"  (* Gérer le cas où la colonne est mal formée *)
  | Col2 (col, rest) -> eval_projection_bis rest (match col with
                                                    | ExID (_, col_name) -> col_name ::acc
                                                    | _ -> failwith "Invalid column structure")
and eval_source source =
  match source with
  | ID table_name -> table_name
and eval_condition condition table_records =
  (* Implémentez la logique pour évaluer la condition de la requête *)
  table_records  (* Dans cet exemple, on renvoie simplement toutes les lignes de la table *)
and eval_projection_result record projected_columns =
  (* Renvoie les valeurs projetées de l'enregistrement *)
  List.map (fun col ->
              try List.assoc col record
              with Not_found -> error ("Column not found in record: " ^ col)) projected_columns

(* Appel initial *)
let evaluate_query query = eval_query query init_env
