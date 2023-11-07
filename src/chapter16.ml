(* 第16章 情報の蓄積 *)

(* 16.1 情報の欠落 *)

(* 距離と距離の合計を持っている型 *)
type distance_t = {
  kyori : float;
  total : float;
} ;;

(* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
(* total_distance : distance_t list -> distance_t list *)
let rec total_distance lst = match lst with
    [] -> []
  | {kyori = k; total = t} :: rest ->
    [] ;;

(* 16.2 アキュムレータ *)

(* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
(* hojo : distance_t list -> float -> distance_t list *)
let rec hojo lst total0 = match lst with
    [] -> []
  | {kyori = k; total = t} :: rest ->
      [] ;;

(* total0はこれまでの距離の合計 *)
let rec hojo lst total0 = match lst with
    [] -> []
  | {kyori = k; total = t} :: rest ->
      {kyori = k; total = total0 +. k} :: hojo rest (total0 +. k) ;;

(* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
(* total_distance : distance_t list -> distance_t list *)
let total_distance lst = hojo lst 0.0 ;;

(* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
(* total_distance : distance_t list -> distance_t list *)
let total_distance lst =
  (* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
  (* total0はこれまでの距離の合計 *)
  (* hojo : distance_t list -> float -> distance_t list *)
  let rec hojo lst total0 = match lst with
      [] -> []
    | {kyori = k; total = t} :: rest ->
        {kyori = k; total = total0 +. k} :: hojo rest (total0 +. k)
  in hojo lst 0.0 ;;
 