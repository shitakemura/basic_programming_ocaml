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