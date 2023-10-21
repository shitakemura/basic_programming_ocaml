(* 目的 : リストlstの中から条件pを満たす要素のみを取り出す *)
let rec filter p lst = match lst with
    [] -> []
  | first :: rest ->
    if p first then first :: filter p rest
               else filter p rest
