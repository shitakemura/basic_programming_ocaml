(* 第10章 再帰関数を使ったプログラミング *)

(* 10.1 関数のネスト *)

(* 目的: 受け取ったlstの要素それぞれの先頭にnをくっつける *)
(* add_to_each : int -> int list list -> int list list *)
let rec add_to_each n lst = match lst with
    [] -> []
  | first :: rest -> (n :: first) :: add_to_each n rest ;;

(* テスト *)
let test1 = add_to_each 1 [] = [] ;;
let test2 = add_to_each 1 [[2]] = [[1; 2]] ;;
let test3 = add_to_each 1 [[2]; [2; 3]] = [[1; 2]; [1; 2; 3]] ;;
let test4 = add_to_each 1 [[2]; [2; 3]; [2; 3; 4]] = [[1; 2]; [1; 2; 3]; [1; 2; 3; 4]] ;;

(* 目的 : 受け取ったlstの接頭語のリストを求める *)
(* prefix : int list -> int list list *)
let rec prefix lst = match lst with
    [] -> []
  | first :: rest -> [first] :: add_to_each first (prefix rest) ;;

(* テスト *)
let test5 = prefix [] = [] ;;
let test6 = prefix [1] = [[1]] ;;
let test7 = prefix [1; 2] = [[1]; [1; 2]] ;;
let test8 = prefix [1; 2; 3; 4] = [[1]; [1; 2]; [1; 2; 3]; [1; 2; 3; 4]] ;;

(* 10.2 リストの中の最小値を求める関数 *)

(* 目的 : 受け取ったlstの中の最小値を返す *)
(* minimum : int list -> int *)
let rec minimum lst = match lst with
    [] -> max_int
  | first :: rest -> 
      if first <= minimum rest 
        then first 
        else minimum rest ;;

(* テスト *)
let test1 = minimum [3] = 3 ;;
let test2 = minimum [1; 2] = 1 ;;
let test3 = minimum [3; 2] = 2 ;;
let test4 = minimum [3; 2; 6; 4; 1; 8] = 1 ;;

(* 10.3 局所変数定義 *)
let x = 2 in x + x ;;

let x = 3 in let y = 4 in x + y ;;

(* 目的 : 受け取ったlstの中の最小値を返す *)
(* minimum : int list -> int *)
let rec minimum lst = match lst with
    [] -> max_int
  | first :: rest ->
      let min_rest = minimum rest in
      if first <= min_rest
      then first
      else min_rest ;;
