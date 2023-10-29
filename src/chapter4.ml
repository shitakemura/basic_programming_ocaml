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

(* 4.4 型推論と型チェック *)
let f2 x = 3.0 *. x ;;
f2 2.5 ;;

(* 4.5 関数の実行方法 *)
let jikyu = 950 ;;
let kihonkyu = 100 ;;
let kyuyo x = kihonkyu + x * jikyu ;;
kyuyo 25 + kyuyo 28 + kyuyo 31 ;;

(* 4.6 関数定義に対するデザインレシピ *)

(* 目的 : 働いた時間xに応じたアルバイト代を計算する *)
(* kyuyo : int -> int *)
let kyuyo x = 0 ;;

(* テスト *)
let test1 = kyuyo 25 = 23850 ;;
let test2 = kyuyo 28 = 26700 ;;
let test3 = kyuyo 31 = 29550 ;;

(* ----------------------- *)
(* 時給（円） *)
let jikyu = 950 ;;
(* 基本給（円） *)
let kihonkyu = 100 ;;

(* 目的 : 働いた時間xに応じたアルバイト代を計算する *)
(* kyuyo : int -> int *)
let kyuyo x = kihonkyu + x * jikyu ;;

(* テスト *)
let test1 = kyuyo 25 = 23850 ;;
let test2 = kyuyo 28 = 26700 ;;
let test3 = kyuyo 31 = 29550 ;;
(* ----------------------- *)
