(* 第14章 高階関数を使ったリスト処理 *)

(* 14.1 条件を満たす要素を取り出す関数 *)

(* 14.2 各要素をまとめあげる関数 *)

(* 14.3 局所関数定義 *)

(* 14.4 名前のない関数 *)
fun x -> x + 1 ;;
(fun x -> x + 1) 5 ;;

let add1 = fun x -> x + 1 ;;
add1 5 ;;

(* 14.5 infix関数とprefix関数 *)
(+) 3 5 ;;
