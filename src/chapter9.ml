(* 第9章 リスト *)

(* 9.1 リスクの構造 *)
"日曜日" :: "月曜日" :: "火曜日" :: "水曜日" :: "木曜日" :: "金曜日" :: "土曜日" :: [] ;;

(* 9.2 リストの構文と型 *)
1 :: 2 :: 3 :: [] ;;

[1; 2; 3] ;;

1 :: [2; 3] ;;
1 :: 2 :: [3] ;;

[true; false; true] ;;

[] ;;

let lst = [1; 2; 3; 4; 5] ;;

[[1; 3]; [2]; [4; 1; 3; 5]; []; [2; 5]] ;;

(* 9.3 リストとパターンマッチ *)
match [] with
    [] -> 0
  | first :: rest -> first ;;

match [1; 2; 3] with
    [] -> 0
  | first :: rest -> first ;;

(* 9.4 再帰関数 *)

(* 目的 : 受け取ったリストlstに0が含まれているかを調べる *)
(* contain_zero : int list -> bool *)
let rec contain_zero lst = match lst with
    [] -> false
  | first :: rest -> if first = 0 then true 
                                  else contain_zero rest ;;

(* テスト *)
let test1 = contain_zero [] = false ;;
let test2 = contain_zero [0; 2] = true ;;
let test3 = contain_zero [1; 2] = false ;;
let test4 = contain_zero [1; 2; 3; 0; 5; 6; 7] = true ;;
let test5 = contain_zero [1; 2; 3; 4; 5; 6; 7] = false ;;

(* 9.5 再帰関数に対するデザインレシピ *)

(* 目的 : 受け取ったリストlstの各要素の和を求める *)
(* sum : int list -> list *)
let rec sum lst = match lst with
    [] -> 0
  | first :: rest -> first + sum rest ;;

(* テスト *)
let test1 = sum [] = 0 ;;
let test2 = sum [2] = 2 ;;
let test3 = sum [1; 3] = 4 ;;
let test4 = sum [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] = 55 ;;

(* 9.6 テンプレートの複合 *)

(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string;
} ;;

(* gakusei_t list型のデータの例 *)
let lst1 = [] ;;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}] ;;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
            {namae = "kaneko"; tensuu = 80; seiseki = "A"}] ;;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"};
            {namae = "asai"; tensuu = 70; seiseki = "B"};
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] ;;

(* 目的 : 学生リストlstのうち成績がAの人の数を返す *)
(* count_A : gakusei_t list -> int *)
let rec count_A lst = match lst with
    [] -> 0
  | first :: rest -> (match first with
                        {namae = n; tensuu = t; seiseki = s}
                          -> if s = "A" 
                              then 1 + count_A rest
                              else count_A rest
                      ) ;;

let rec count_A lst = match lst with
    [] -> 0
  | {namae = n; tensuu = t; seiseki = s} :: rest
      -> if s = "A"
          then 1 + count_A rest
          else count_A rest ;;

(* テスト *)
let test1 = count_A lst1 = 0 ;;
let test2 = count_A lst2 = 0 ;;
let test3 = count_A lst3 = 1 ;;
let test3 = count_A lst3 = 1 ;;
