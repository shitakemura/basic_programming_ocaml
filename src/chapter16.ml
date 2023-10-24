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

(* 16.3 アキュムレータの活用 *)

(* 目的 : 与えられたリストを逆順にして返す *)
(* let rec reverse lst = match lst with
    [] -> []
  | first :: rest -> [] *)

(* 目的 : (lstの逆順のリスト) @ result を返す *)
(* let rec rev lst result = match lst with
    [] -> result
  | first :: rest -> rev rest (first :: result) *)

(* 目的 : 与えられたリストを逆順にして返す *)
let reverse lst =
  let rec rev lst result = match lst with
      [] -> result
    | first :: rest -> rev rest (first :: result)
  in rev lst []

(* 16.5 プログラム作成のプロセス *)
