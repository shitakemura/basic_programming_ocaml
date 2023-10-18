(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string;
}

(* 目的: 学生のデータgakuseiを受け取り成績のついたデータを返す *)
(* hyouka : gakusei_t -> gakusei_t *)
let hyouka gakusei = match gakusei with 
  {namae = n; tensuu = t; seiseki = s} ->  
    {namae = n;
     tensuu = t;
     seiseki = if t >= 80 then "A"
               else if t >= 70 then "B"
               else if t >= 60 then "C"
               else "D"}

(* テスト *)
let test1 = hyouka {namae="asai"; tensuu=90; seiseki=""} = {namae="asai"; tensuu=90; seiseki="A"}
let test2 = hyouka {namae="asai"; tensuu=80; seiseki=""} = {namae="asai"; tensuu=80; seiseki="A"}
let test3 = hyouka {namae="asai"; tensuu=75; seiseki=""} = {namae="asai"; tensuu=75; seiseki="B"}
let test4 = hyouka {namae="asai"; tensuu=70; seiseki=""} = {namae="asai"; tensuu=70; seiseki="B"}
let test5 = hyouka {namae="asai"; tensuu=65; seiseki=""} = {namae="asai"; tensuu=65; seiseki="C"}
let test6 = hyouka {namae="asai"; tensuu=60; seiseki=""} = {namae="asai"; tensuu=60; seiseki="C"}
let test7 = hyouka {namae="asai"; tensuu=55; seiseki=""} = {namae="asai"; tensuu=55; seiseki="D"}

(* 目的 : 学生のリストlstを受け取り成績を入れたリストを返す *)
let rec map_hyouka lst = match lst with
    [] -> []
  | first :: rest -> hyouka first :: map_hyouka rest
