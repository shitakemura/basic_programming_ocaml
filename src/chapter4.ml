(* 第4章 関数の定義 *)

(* 4.1 関数定義の必要性 *)
let jikyu = 950 ;;
let kihonkyu = 100 ;;

(25 * jikyu) + (28 * jikyu) + (31 * jikyu) ;;
(kihonkyu + 25 * jikyu) + (kihonkyu + 28 * jikyu) + (kihonkyu + 31 * jikyu) ;;

(* 4.2 関数定義の構文 *)
let f x = 3 * x ;;
f 4 ;;

let g x y = x * x + y * y - 4 ;;
g 3 2 ;;

let kyuyo x = kihonkyu + x * jikyu ;;
kyuyo 25 + kyuyo 28 + kyuyo 31 ;;

(* 4.3 関数の型 *)
let f x = 3 * x ;;
(* val f : int -> int = <fun> *)

let g x y = x * x + y * y - 4 ;;
(* val g : int -> int -> int = <fun> *)
(* A -> B -> C は A -> (B -> C) *)

(* 4.4 型推論と型チェック *)
let f x = 3 * x ;;
(* f 2.5 *)
(* This expression has type float but an expression was expected of type int *)

let f2 x = 3.0 *. x ;;
f2 2.5 ;;

(* Ocamlインタプリタは裏で型に関してふたつのことをしている。 *)
(* 型推論 *)
(* 型チェック *)

(* 4.5 関数の実行方法 *)
let jikyu = 950 ;;
let kihonkyu = 100 ;;
let kyuyo x = kihonkyu + x * jikyu ;;
kyuyo 25 + kyuyo 28 + kyuyo 31 ;;

(* 4.6 関数定義に対するデザインレシピ *)

(* #use "kyuyo.ml" ;; *)
