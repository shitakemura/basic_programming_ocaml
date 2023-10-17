(* 学生ひとり分のデータを表す型 *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string;
}

(* 目的 : 学生リストlstのうち成績がseiseki0の人の数を返す *)
let rec count lst seiseki0 = match lst with
    [] -> 0
  | {namae = n; tensuu = t; seiseki = s} :: rest
    -> if s = seiseki0
        then 1 + count rest seiseki0
        else count rest seiseki0

(* テスト *)
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"};
            {namae = "asai"; tensuu = 70; seiseki = "B"};
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] ;;

count lst4 "A" ;;
count lst4 "B" ;;