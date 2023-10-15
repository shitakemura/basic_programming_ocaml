(* 第10章 再帰関数を使ったプログラミング *)

(* 10.1 関数のネスト *)
(* # use "functions/add_to_each.ml" ;; *)

(* 10.2 リストの中の最小値を求める問題 *)
(* # use "functions/minimum.ml" ;; *)

(* 10.3 局所変数定義 *)
let x = 2 in x + x ;;

let x = 3 in let y = 4 in x + y ;;

(* 10.4 パターンマッチつき局所変数定義 *)
(* # use "functions/shukei.ml" ;; *)

(* 10.5 ふたつのリストを結合する関数 *)
(* # use "functions/append.ml" ;; *)

(* 10.6 ふたつの照準に並んだリストをマージする関数 *)
(* # use "functions/merge.ml" ;; *)
