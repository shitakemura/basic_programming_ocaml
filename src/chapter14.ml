(* 第14章 高階関数を使ったリスト処理 *)

(* 14.1 条件を満たす要素を取り出す関数 *)

(* 目的 : 受け取ったリストlstから正の要素のみを取り出す *)
(* filter_positive : int list -> int list *)
let rec filter_positive lst = match lst with
    [] -> []
  | first :: rest ->
    if first > 0 then first :: filter_positive rest
                 else filter_positive rest ;;

(* 目的 : 整数nが3で割ると1余りかを調べる *)
(* is_mod3_1 : int -> bool *)
let is_mod3_1 n = n mod 3 = 1 ;;

(* 目的 : リストlstから3で割ると1余る要素のみを取り出す *)
(* filter_mod3_1 : int list -> int list *)
let rec filter_mod3_1 lst = match lst with
    [] -> []
  | first :: rest ->
    if is_mod3_1 first then first :: filter_mod3_1 rest
                       else filter_mod3_1 rest ;;

(* 目的 : リストlstの中から条件pを満たす要素のみを取り出す *)
(* filter : ('a -> bool) -> 'a list -> 'a list *)
let rec filter p lst = match lst with
    [] -> []
  | first :: rest ->
    if p first then first :: filter p rest
               else filter p rest ;;

(* 目的 : リストlstから3で割ると1余る要素のみを取り出す *)
(* filter_mod3_1 : int list -> int list *)
let filter_mod3_1 lst = filter is_mod3_1 lst ;;

(* 目的 : 整数nが正かどうかを調べる *)
(* is_positive : int -> bool *)
let is_positive n = n > 0 ;;

(* 目的 : 受け取ったリストlstから正の要素のみを取り出す *)
(* filter_positive : int list -> int list *)
let filter_positive lst = filter is_positive lst ;;

(* 14.2 各要素をまとめあげる関数 *)

(* 目的 : 受け取ったリストlstの各要素の和を求める *)
(* sum : int list -> int *)
let rec sum lst = match lst with
    [] -> 0
  | first :: rest -> first + sum rest ;;

(* 目的 : 受け取ったリストlstの長さを求める *)
(* length : 'a list -> int *)
let rec length lst = match lst with
    [] -> 0
  | first :: rest -> 1 + length rest ;;

(* 目的 : lst1とlst2を受け取りそれらを結合したリストを返す *)
(* append : 'a list -> 'a list -> 'a list *)
let rec append lst1 lst2 = match lst1 with
    [] -> lst2
  | first :: rest -> first + append rest lst2 ;;

(* 目的 : initから始めてlstの要素を右から順にfを施し込む *)
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right f lst init = match lst with
    [] -> init
  | first :: rest -> f first (fold_right f rest init) ;;

(* 目的 : firstとrest_resultを加える *)
(* add_int : int -> int -> int *)
let add_int first rest_result = first + rest_result ;;

(* 目的 : 受け取ったlstの各要素の和を求める *)
(* sum : int list -> int *)
let sum lst = fold_right add_int lst 0 ;;

(* 目的 : firstは無視してrest_resultに1を加える *)
(* add_one : int -> int -> int *)
let add_one first rest_result = 1 + rest_result ;;

(* 目的 : 受け取ったlstの長さを求める *)
(* length: 'a list -> int *)
let length lst = fold_right add_one lst 0 ;;

(* 目的 : firstをリストrest_resultの先頭に加える *)
(* cons : 'a -> 'a list -> 'a list *)
let cons first rest_result = first :: rest_result ;;

(* 目的 : lst1とlst2を受け取りそれらを結合したリストを返す *)
(* append : 'a list -> 'a list -> 'a list *)
let append lst1 lst2 = fold_right cons lst1 lst2 ;;

(* 14.3 局所関数定義 *)

(* 目的 : 受け取ったリストlstの各要素の和を求める *)
(* sum : int list -> int *)
let sum lst =
  (* 目的 : firstとrest_resultを加える *)
  (* add_int : int -> int -> int *)
  let add_int first rest_result = first + rest_result
  in fold_right add_int lst 0 ;;

(* 14.4 名前のない関数 *)
fun x -> x + 1 ;;

(fun x -> x + 1) 5 ;;

let add1 = fun x -> x + 1 ;;

let add1 x = x + 1 ;;

(* 目的 : 受け取ったリストlstの各要素の和を求める *)
(* sum : int list -> int *)
let sum lst =
  fold_right (fun first rest_result -> first + rest_result) lst 0 ;;

(* 目的 : 受け取ったlstの長さを求める *)
(* length : 'a list -> int *)
let length lst =
  fold_right (fun first rest_result -> 1 + rest_result) lst 0 ;;

(* 目的 : lst1とlst2を受け取りそれらを結合したリストを返す *)
(* append : 'a list -> 'a list -> 'a list *)
let append lst1 lst2 =
  fold_right (fun first rest_result -> first :: rest_result) lst1 lst2 ;;

(* 14.5 infix関数とprefix関数 *)

(+) 3 5 ;;

(* 目的 : 受け取ったリストlstの各要素の和を求める *)
(* sum : int list -> int *)
let sum lst =
  fold_right (fun first rest_result -> first + rest_result) lst 0 ;;

let sum lst = fold_right (+) lst 0 ;;
