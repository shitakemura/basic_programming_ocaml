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

(* 13.2 関数の一般化とmap *)

(* 目的 : 実数のリストlstを受け取り各要素の平方根のリストを返す *)
(* map_sqrt : flost list -> float list *)
let rec map_sqrt lst = match lst with
    [] -> []
  | first :: rest -> sqrt first :: map_sqrt rest ;;

(* 目的 : 学生のリストlstを受け取り成績を受けたリストを返す *)
(* map_hyouka : gakusei_t list -> gakusei_t list *)

let hyouka gakusei = match gakusei with
  {namae = n; tensuu = t; seiseki = s} ->
    {namae = n;
     tensuu = t;
     seiseki = if t >= 80 then "A"
               else if t >=70 then "B"
               else if t >= 60 then "C"
               else "D"} ;;

let rec map_hyouka lst = match lst with
    [] -> []
  | first :: rest -> hyouka first :: map_hyouka rest ;;

(* 目的 : 関数fとリストlstを受け取りfを施したリストを返す *)
(* map : ('a -> 'b) -> 'a list -> 'b list *)
let rec map f lst = match lst with
    [] -> []
  | first :: rest -> f first :: map f rest ;;

map sqrt [2.0; 3.0] ;;
map sin [2.0; 3.0] ;;

(* 目的 : 実数のリストlstを受け取り各要素の平方根のリストを返す *)
(* map_sqrt : float list -> float list *)
let map_sqrt lst = map sqrt lst ;;

(* 目的 : 学生リストlstを受け取り成績を入れたリストを返す *)
(* map_hyouka : gakusei_t list -> gakusei_t list *)
let map_hyouka lst = map hyouka lst ;;
