(* 第10章 再帰関数を使ったプログラミング *)

(* 10.1 関数のネスト *)

(* 目的: 受け取ったlstの要素それぞれの先頭にnをくっつける *)
(* add_to_each : int -> int list list -> int list list *)
let rec add_to_each n lst = match lst with
    [] -> []
  | first :: rest -> (n :: first) :: add_to_each n rest ;;

(* テスト *)
let test1 = add_to_each 1 [] = [] ;;
let test2 = add_to_each 1 [[2]] = [[1; 2]] ;;
let test3 = add_to_each 1 [[2]; [2; 3]] = [[1; 2]; [1; 2; 3]] ;;
let test4 = add_to_each 1 [[2]; [2; 3]; [2; 3; 4]] = [[1; 2]; [1; 2; 3]; [1; 2; 3; 4]] ;;

(* 目的 : 受け取ったlstの接頭語のリストを求める *)
(* prefix : int list -> int list list *)
let rec prefix lst = match lst with
    [] -> []
  | first :: rest -> [first] :: add_to_each first (prefix rest) ;;

(* テスト *)
let test5 = prefix [] = [] ;;
let test6 = prefix [1] = [[1]] ;;
let test7 = prefix [1; 2] = [[1]; [1; 2]] ;;
let test8 = prefix [1; 2; 3; 4] = [[1]; [1; 2]; [1; 2; 3]; [1; 2; 3; 4]] ;;

(* 10.2 リストの中の最小値を求める関数 *)

(* 目的 : 受け取ったlstの中の最小値を返す *)
(* minimum : int list -> int *)
let rec minimum lst = match lst with
    [] -> max_int
  | first :: rest -> 
      if first <= minimum rest 
        then first 
        else minimum rest ;;

(* テスト *)
let test1 = minimum [3] = 3 ;;
let test2 = minimum [1; 2] = 1 ;;
let test3 = minimum [3; 2] = 2 ;;
let test4 = minimum [3; 2; 6; 4; 1; 8] = 1 ;;

(* 10.3 局所変数定義 *)
let x = 2 in x + x ;;

let x = 3 in let y = 4 in x + y ;;

(* 目的 : 受け取ったlstの中の最小値を返す *)
(* minimum : int list -> int *)
let rec minimum lst = match lst with
    [] -> max_int
  | first :: rest ->
      let min_rest = minimum rest in
      if first <= min_rest
      then first
      else min_rest ;;

(* 10.4 パターンマッチつき局所変数定義 *)

type gakusei_t = {
  namae : string;
  tensuu : int ;
  seiseki : string ;
} ;;

(* 目的 : 学生lstのうち各成績の人数を集計する *)
(* shukei : gakusei_t list -> int * int * int * int *)
let rec shukei lst = match lst with
    [] -> (0, 0, 0, 0)
  | {namae = n; tensuu = t; seiseki = s} :: rest ->
      let shukei_rest = shukei rest in
      match shukei_rest with
        (a, b, c, d) -> if s = "A" then (a + 1, b, c, d)
                        else if s = "B" then (a, b + 1, c, d)
                        else if s = "C" then (a, b, c + 1, d)
                        else (a, b, c, d + 1) ;;

let rec shukei lst = match lst with
    [] -> (0, 0, 0, 0)
  | {namae = n; tensuu = t; seiseki = s} :: rest ->
      let (a, b, c, d) = shukei rest in
      if s = "A" then (a + 1, b, c, d)
      else if s = "B" then (a, b + 1, c, d)
      else if s = "C" then (a, b, c + 1, d)
      else (a, b, c, d + 1) ;;

(* 10.5 ふたつのリストを結合する関数 *)

(* 目的 : lst1とlst2を受け取りそれらを結合したリストを返す *)
(* append : 'a list -> 'a list -> 'a list *)
let rec append lst1 lst2 = match lst1 with
    [] -> lst2
  | first :: rest -> first :: append rest lst2 ;;

(* テスト *)
let test1 = append [] [] = [] ;;
let test2 = append [] [1; 2] = [1; 2] ;;
let test3 = append [1; 2] [] = [1; 2] ;;
let test4 = append [1; 2] [3; 4] = [1; 2; 3; 4] ;;
let test5 = append ["a"; "b"; "c"; "d"; "e"] ["f"; "g"] = ["a"; "b"; "c"; "d"; "e"; "f"; "g"] ;;

(* 10.6 ふたつの昇順に並んだリストをマージする関数 *)

(* 目的 : 昇順に並んでいるリストlst1とlst2をマージする *)
(* merge : int list -> int list -> int list *)
let rec merge lst1 lst2 = match (lst1, lst2) with
    ([], []) -> []
  | ([], first2 :: rest2) -> lst2
  | (first1 :: rest1, []) -> lst1
  | (first1 :: rest1, first2 :: rest2) ->
    if first1 < first2
    then first1 :: merge rest1 lst2
    else first2 :: merge lst1 rest2 ;;

(* テスト *)
let test1 = merge [] [] = [] ;;
let test2 = merge [] [1; 2] = [1; 2] ;;
let test3 = merge [1; 2] [] = [1; 2] ;;
let test4 = merge [1; 3] [2; 4] = [1; 2; 3; 4] ;;
let test5 = merge [2; 4] [1; 3] = [1; 2; 3; 4] ;;
let test6 = merge [1; 4] [1; 3] = [1; 1; 3; 4] ;;
