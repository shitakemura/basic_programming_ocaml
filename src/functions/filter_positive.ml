(* 目的 : 整数nが正かどうかを調べる *)
let is_positive n = n > 0

(* 目的 : 受け取ったリストlstから正の要素のみを取り出す *)
(* let rec filter_positive lst = match lst with
    [] -> []
  | first :: rest ->
    if first > 0 then first :: filter_positive rest
                 else filter_positive rest *)

let rec filter_positive lst = match lst with
    [] -> []
  | first :: rest -> 
    if is_positive first then first :: filter_positive rest
                         else filter_positive rest
