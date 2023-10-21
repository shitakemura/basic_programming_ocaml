(* 目的 : initから始めてlstの要素を右から順にfを施し込む *)
let rec fold_right f lst init = match lst with
    [] -> init
  | first :: rest -> f first (fold_right f rest init)

(* sum *)
(* 目的 : firstとrest_resultを加える *)
let add_int first rest_result = first + rest_result

(* 目的 : 受け取ったリストlstの各要素の和を求める *)
let sum lst = fold_right add_int lst 0

(* 局所関数を使用した場合 *)
let sum lst = 
  let add_int first rest_result = first + rest_result
  in fold_right add_int lst 0

(* 名前のない関数を使用した場合 *)
let sum lst = 
  fold_right (fun first rest_result -> first + rest_result) lst 0

(* length *)
(* 目的 : firstは無視してrest_resultに1を加える *)
let add_one first rest_result = 1 + rest_result

(* 目的 : 受け取ったリストlstの長さを求める *)
let length lst = fold_right add_one lst 0

(* 名前のない関数を使用した場合 *)
let length lst = 
  fold_right (fun first rest_result -> 1 + rest_result) lst 0

(* append *)
(* 目的 : firstをリストrest_resultの先頭に加える *)
let cons first rest_result = first :: rest_result

(* 目的 : lst1とlst2を受け取りそれらを結合したリストを返す *)
let append lst1 lst2 = fold_right cons lst1 lst2

(* 名前のない関数を使用した場合 *)
let append lst1 lst2 = 
  fold_right (fun first rest_result -> first :: rest_result) lst1 lst2
