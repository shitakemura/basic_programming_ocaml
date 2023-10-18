(* 目的 : 実数のリストlstを受け取り各要素の平方根のリストを返す *)
let rec map_sqrt lst = match lst with
    [] -> []
  | first :: rest -> sqrt first :: map_sqrt rest
