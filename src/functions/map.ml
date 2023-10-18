(* 目的 : 関数fとリストlstを受け取りfを施したリストを返す *)
let rec map f lst = match lst with
    [] -> []
  | first :: rest -> f first :: map f rest
  