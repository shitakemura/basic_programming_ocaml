(* 目的 : 受け取ったリストlstの長さを求める *)
let rec length lst = match lst with
    [] -> 0
  | first :: rest -> 1 + length rest
