(* 第8章 レコード *)

(* 8.1 レコードの必要性 *)

(* 8.2 レコードの構文 *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string;
} ;;

{namae = "asai"; tensuu = 70; seiseki = "B"} ;;
{tensuu = 70; namae = "asai"; seiseki = "B" } ;;

(* 8.3 レコードとパターンマッチ *)
let tsuuchi gakusei = match gakusei with
  {namae = n; tensuu = t; seiseki = s} ->
    n ^ " さんは " ^ string_of_int t ^ " 点で、成績は " ^ s ^ " です。 " ;;
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
  namae: string;
  tensuu: int;
  seiseki: string;
} ;;

(* 8.6 データ定義に対するデザインレシピ *)
(* # use "functions/hyouka.ml" ;; *)
