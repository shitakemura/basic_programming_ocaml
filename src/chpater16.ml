(* 第16章 情報の蓄積 *)

(* 16.1 情報の欠落 *)

(* 距離と距離の合計を持っている型 *)
type distance_t = {
  kyori : float;
  total : float;
}

(* 目的 : 先頭からリスト中の各点までの距離の合計を計算する *)
let rec total_distance lst = match lst with
    [] -> []
  | {kyori = k; total = t} :: rest ->
      []