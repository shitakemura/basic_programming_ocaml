(* 第7章 組とパターンマッチ *)

(* 7.1 組の構文 *)
(3.14, 2.71) ;;

(3, true) ;;

(3, "a", 3.14) ;;

((3, "a"), 3.14) ;;

3.14, 2.71 ;;

(* 7.2 パターンマッチ *)
match (3, 5) with
  (a, b) -> a + b ;;

let add pair = match pair with
  (a, b) -> a + b ;;

add (3, 5) ;;

let add (a, b) = a + b ;;

let add2 a b = a + b ;;

add2 3 5 ;;

(* 7.3 構造データに対するデザインレシピ *)

(* 目的 : ふたつの整数の組pairを受け取りその要素の和を返す *)
(* add : int * int -> int *)
let add pair = match pair with
  (a, b) -> a + b ;;

(* テスト *)
let test1 = add (0, 0) = 0 ;;
let test2 = add (3, 5) = 8 ;;
let test3 = add (3, -5) = -2 ;;

(* 7.4 パターンマッチの実行方法 *)
