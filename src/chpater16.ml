(* 第16章 情報の蓄積 *)

(* 16.1 情報の欠落 *)

(* 距離と距離の合計を持っている型 *)
type distance_t = {
  kyori : float;
  total : float;
}

(* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
(* let rec total_distance lst = match lst with
    [] -> []
  | {kyori = k; total = t} :: rest ->
      [] *)
  
(* 16.2 アキュムレーター *)

(* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
(* total0 : アキュムレータ *)
(* let rec hojo lst total0 = match lst with
    [] -> []
  | {kyori = k; total = t} :: rest -> 
      {kyori = k; total = total0 +. k} :: hojo rest (total0 +. k)

let total_distance lst = hojo lst 0.0 *)

let total_distance lst =
  let rec hojo lst total0 = match lst with
      [] -> []
    | {kyori = k; total = t} :: rest ->
        {kyori = k; total = total0 +. k} :: hojo rest (total0 +. k)
    in hojo lst 0.0