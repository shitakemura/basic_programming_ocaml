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