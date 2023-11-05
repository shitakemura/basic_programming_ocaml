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
