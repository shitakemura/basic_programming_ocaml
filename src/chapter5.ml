(* 第5章 条件分岐 *)

(* 5.1 条件分岐の必要性 *)
let yugu_jikyu = 980 ;;

(* 5.2 条件分岐の構文 *)
if true then 1 else 2 ;;
if false then 1 else 2 ;;

if 1 < 2 then 3 else 4 ;;
if 3 + 4 < 5 then 1 else 2 ;;

(* 5.3 kyuyoの例 *)

(* 時給（円） *)
let jikyu = 950 ;;
(* 基本給（円） *)
let kihonkyu = 100 ;;
(* 優遇時給（円） *)
let yugu_jikyu = 980 ;;

let kyuyo x =
  if x < 30 then kihonkyu + x * jikyu
            else kihonkyu + x * yugu_jikyu ;;

(* テスト *)
let test = kyuyo 31 = 30480 ;;

(* 5.4 式としてのif文 *)
let kyuyo x = kihonkyu + x * (if x < 30 then jikyu else yugu_jikyu) ;;

(* 5.5 条件分岐に対するデザインレシピ *)

(* 目的 : 受け取った実数xの絶対値を計算する *)
(* abs_value : float -> float *)
let abs_value x =
  if x > 0.0 then x
             else -. x ;;

(* テスト *)
let test1 = abs_value 2.8 = 2.8 ;;
let test2 = abs_value (-2.8) = 2.8 ;;
let test3 = abs_value 0.0 = 0.0 ;;

