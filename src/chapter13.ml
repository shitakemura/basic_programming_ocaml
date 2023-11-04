(* 第13章 一般化と高階関数 *)

(* 13.1 データの一般化 *)

type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string;
}

(* 目的 : 学生リストlstのうち成績がAの人の数を返す *)
(* count_A : gakusei_t list -> int *)
let rec count_A lst = match lst with
    [] -> 0
  | {namae = n; tensuu = t; seiseki = s} :: rest ->
      if s = "A" then 1 + count_A rest
                 else count_A rest ;;
