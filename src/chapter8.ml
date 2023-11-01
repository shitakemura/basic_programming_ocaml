(* 第8章 レコード *)

(* 8.1 レコードの必要性 *)
("asai", 70) ;;

(* 8.2 レコードの構文 *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string;
} ;;

{namae = "asai"; tensuu = 70; seiseki = "B"} ;;
{tensuu = 70; namae = "asai"; seiseki = "B"} ;;

(* 8.3 レコードとパターンマッチ *)
let tsuuchi gakusei = match gakusei with
  {namae = n; tensuu = t; seiseki = s} ->
    n ^ " さんは " ^ string_of_int t ^ " 点で、成績は " ^ s ^ " です。" ;; 

tsuuchi {namae="asai"; tensuu=70; seiseki="B"} ;;

let hyouka gakusei = match gakusei with
  {namae = n; tensuu = t; seiseki = s} ->
    {namae = n;
     tensuu = t;
     seiseki = if t >= 80 then "A"
               else if t >= 70 then "B"
               else if t >= 60 then "C"
               else "D"
    } ;;

hyouka {namae="asai"; tensuu=70; seiseki=""} ;;

tsuuchi (hyouka {namae="asai"; tensuu=70; seiseki=""}) ;;

(* 8.4 そのほかの記法 *)
let asai = {namae = "asai"; tensuu = 70; seiseki = "B"} ;;
asai.namae ;;
asai.tensuu ;;
asai.seiseki ;;

(* 8.5 ユーザによる型定義 *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string;
} ;;

(* 8.6 データ定義に対するデザインレシピ *)

(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string ;
} ;;

(* 目的 : 学生のデータgakuseiを受け取り成績のついたデータを返す *)
(* hyouka : gakusei_t -> gakusei_t *)
let hyouka gakusei = match gakusei with
  {namae = n; tensuu = t; seiseki = s} ->
    if t >= 80 then {namae = n; tensuu = t; seiseki = "A"}
    else if t >= 70 then {namae = n; tensuu = t; seiseki = "B"}
    else if t >= 60 then {namae = n; tensuu = t; seiseki = "C"}
    else {namae = n; tensuu = t; seiseki = "D"} ;;

let hyouka gakusei = match gakusei with
  {namae = n; tensuu = t; seiseki = s} ->
    {namae = n;
     tensuu = t;
     seiseki = if t >= 80 then "A"
               else if t >=70 then "B"
               else if t >= 60 then "C"
               else "D"} ;;

(* テスト *)
let test1 = hyouka {namae="arai"; tensuu=90; seiseki=""} = {namae="arai"; tensuu=90; seiseki="A"} ;;
let test2 = hyouka {namae="arai"; tensuu=80; seiseki=""} = {namae="arai"; tensuu=80; seiseki="A"} ;;
let test3 = hyouka {namae="arai"; tensuu=75; seiseki=""} = {namae="arai"; tensuu=75; seiseki="B"} ;;
let test4 = hyouka {namae="arai"; tensuu=70; seiseki=""} = {namae="arai"; tensuu=70; seiseki="B"} ;;
let test5 = hyouka {namae="arai"; tensuu=65; seiseki=""} = {namae="arai"; tensuu=65; seiseki="C"} ;;
let test6 = hyouka {namae="arai"; tensuu=60; seiseki=""} = {namae="arai"; tensuu=60; seiseki="C"} ;;
let test7 = hyouka {namae="arai"; tensuu=55; seiseki=""} = {namae="arai"; tensuu=55; seiseki="D"} ;;
