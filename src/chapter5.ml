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

(* 5.6 真偽値を返す関数 *)

(* 目的 : 現在の気温tから快適度を表す文字列を計算する *)
(* kion : int -> string *)
let kion t =
  if t < 15 then "普通"
            else if t <= 25 then "快適"
            else "普通" ;;

let kion t = 
  if t >= 15 && t <= 25 then "快適"
                        else "普通" ;;

(* テスト *)
let test1 = kion 7 = "普通" ;;
let test2 = kion 15 = "快適" ;;
let test3 = kion 20 = "快適" ;;
let test4 = kion 25 = "快適" ;;
let test5 = kion 28 = "普通" ;;

(* 目的 : 現在の気温tが15以上25以下かどうかをチェックする *)
(* kaiteki : int -> bool *)
let kaiteki t = t >= 15 && t <= 25 ;;

(* テスト *)
let test1 = kaiteki 7 = false ;;
let test2 = kaiteki 15 = true ;;
let test3 = kaiteki 20 = true ;;
let test4 = kaiteki 25 = true ;;
let test5 = kaiteki 28 = false ;;

(* 目的 : 現在の気温tから快適度を表す文字列を計算する *)
(* kion : int -> string *)
let kion t =
  if kaiteki t then "快適"
               else "普通" ;;

(* 5.7 条件分岐の実行方法 *)
