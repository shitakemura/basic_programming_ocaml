(* 第15章 新しい形の再帰 *)

(* 15.1 再帰関数の構造 *)

(* 目的 : 受け取ったリストlstの各要素の和を求める *)
let rec sum lst = match lst with
    [] -> 0
  | first :: rest -> first + sum rest ;;
