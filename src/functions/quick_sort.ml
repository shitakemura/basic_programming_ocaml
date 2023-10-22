(* 目的 : lstの中からnより小さい要素のみを取り出す *)
let take_less n lst = []

(* 目的 : lstの中からnより大きい要素のみを取り出す *)
let take_greater n lst = []

(* 目的 : 受け取ったlstをクイックソートを使って昇順に整列する *)
let rec quick_sort lst = match lst with
    [] -> []
  | first :: rest -> quick_sort (take_less first rest)
                     @ [first]
                     @ quick_sort (take_greater first rest)

(* テスト *)
let test1 = quick_sort [] = []
let test2 = quick_sort [1] = [1]
let test3 = quick_sort [1; 2] = [1; 2]
let test4 = quick_sort [2; 1] = [1; 2]
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]
