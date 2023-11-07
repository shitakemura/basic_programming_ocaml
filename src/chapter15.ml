(* 第15章 新しい形の再帰 *)

(* 15.1 再帰関数の構造 *)

(* 目的 : 受け取ったリストlstの各要素の和を求める *)
let rec sum lst = match lst with
    [] -> 0
  | first :: rest -> first + sum rest ;;

(* 15.2 部分問題の生成 *)

(* 目的 : 受け取ったlstをクイックソートを使って昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst = [] ;;

(* テスト *)
let test1 = quick_sort [] = [] ;;
let test2 = quick_sort [1] = [1] ;;
let test3 = quick_sort [1; 2] = [1; 2] ;;
let test4 = quick_sort [2; 1] = [1; 2] ;;
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9] ;;

(* 目的 : 受け取ったlstをクイックソートを使って昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst =
  if lst = []
    then []
    else [] ;;

(* 目的 : 受け取ったlstをクイックソートを使って昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst = match lst with
    [] -> []
  | first :: rest -> [] ;;

(* 目的 : lstの中からnより小さい要素のみを取り出す *)
(* take_less : int -> int list -> int list *)
let take_less n lst = [] ;;

(* 目的 : lstの中からnより大きい要素のみを取り出す *)
(* take_greater : int -> int list -> int list *)
let take_greater n lst = [] ;;

(* 目的 : 受け取ったlstをクイックソートを使って昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst = match lst with
    [] -> []
  | first :: rest -> quick_sort (take_less first rest)
                     @ [first]
                     @ quick_sort (take_greater first rest) ;;

(* 15.3 補助関数の作成 *)

(* 目的 : lstの中からnより小さい要素のみを取り出す *)
(* take_less : int -> int list -> int list *)
let rec take_less n lst = match lst with
    [] -> []
  | first :: rest -> if first < n
                     then first :: take_less n rest
                     else take_less n rest ;;

(* 目的 : lstの中からnより大きい要素のみを取り出す *)
(* take_greater : int -> int list -> int list *)
let rec take_greater n lst = match lst with
    [] -> []
  | first :: rest -> if first > n
                     then first :: take_greater n rest
                     else take_greater n rest ;;

(* 目的 : lstの中からnより小さい要素のみを取り出す *)
(* take_less : int -> int list -> int list *)
let take_less n lst = List.filter (fun item -> item < n) lst ;;

(* 目的 : lstの中からnより大きい要素のみを取り出す *)
(* take_greater : int -> int list -> int list *)
let take_greater n lst = List.filter (fun item -> item > n) lst ;;

(* 目的 : 受け取ったlstをクイックソートを使って昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst =
  (* 目的 : lstの中からnよりpである要素のみを取り出す *)
  (* take : int -> int list -> (int -> int -> bool) -> int list *)
  let take n lst p = List.filter (fun item -> p item n) lst
  (* 目的 : lstの中からnより小さい要素のみを取り出す *)
  (* take_less : int -> int list -> int list *)
  in let take_less n lst = take n lst (<)
  (* 目的 : lstの中からnより大きい要素のみを取り出す *)
  (* take_greater : int -> int list -> int list *)
  in let take_greater n lst = take n lst (>)
  in match lst with
      [] -> []
    | first :: rest -> quick_sort (take_less first rest)
                       @ [first]
                       @ quick_sort (take_greater first rest) ;;

(* 15.4 停止性の判定 *)

(* 目的 : 級数の第n項の値を求める *)
(* dai_n_kou : int -> float *)
let rec dai_n_kou n =
  if n = 0 then 1.0
           else dai_n_kou (n - 1) /. float_of_int n ;;

(* 目的 : eの近似値を求める *)
(* e : int -> float *)
let rec e n =
  if dai_n_kou n < 0.00001
  then dai_n_kou n
  else dai_n_kou n +. e (n - 1) ;;
 
let rec e n =
  let d = dai_n_kou n in
  if d < 0.00001 then d
                 else d +. e (n + 1) ;;

(* 15.5 一般の再帰に対するデザインレシピ *)

(* 15.7 例の作成とデバッグについて *)
