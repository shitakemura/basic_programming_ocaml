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

(* 目的 : 学生リストlstのうち成績がBの人の数を返す *)
(* count_B : gakusei_t list -> int *)
let rec count_B lst = match lst with
    [] -> 0
  | {namae = n; tensuu = t; seiseki = s} :: rest ->
      if s = "B" then 1 + count_B rest
                 else count_B rest ;;

(* 目的 : 学生リストlstのうち成績がseiseki0の人の数を返す *)
(* count : gakusei_t list -> string -> int *)
let rec count lst seiseki0 = match lst with
    [] -> 0
  | {namae = n; tensuu = t; seiseki = s} :: rest ->
      if s = seiseki0 then 1 + count rest seiseki0
                      else count rest seiseki0 ;;

let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"};
            {namae = "asai"; tensuu = 70; seiseki = "B"};
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] ;;

count lst4 "A" ;;
count lst4 "B" ;;
count lst4 "C" ;;

(* 目的 : 学生リストlstのうち成績がAの人の数を返す *)
(* count_A : gakusei_t list -> int *)
let count_A lst = count lst "A" ;;

(* 目的 : 学生リストlstのうち成績がBの人の数を返す *)
(* count_B : gakusei_t list -> int *)
let count_B lst = count lst "B" ;;
