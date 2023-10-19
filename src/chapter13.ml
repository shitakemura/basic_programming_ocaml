(* 第13章 一般化と高階関数 *)

(* 13.1 データの一般化 *)
(* # use "functions/count.ml" ;; *)

(* 13.2 関数の一般化とmap *)
(* let res_sqrt = map sqrt [2.0; 3.0] ;; *)
(* let res_sin = map sin [2.0; 3.0] ;; *)

(* 高階関数(higher-order function): 関数を引数として受け取る関数 *)

(* 13.3 多相型と多相関数 *)
(* 多相性 : どのような型でもよいという性質 *)
(* 多相関数 : 多相型をもつ関数のこと、汎用性が高い *)

(* 13.4 値としての関数 *)
3 ;;
sqrt ;;

let twice7 f = f (f 7) ;;

let add3 x = x + 3 ;;

twice7 add3 ;;

(* twice7 add3 *)
(* add3 (add3 7) *)
(* 13 *)