(* 目的 : 整数nが3で割ると1余るかを調べる *)
let is_mod3_1 n = n mod 3 = 1

(* 目的 : リストlstから3で割ると1余る要素のみを取り出す *)
let rec filter_mod3_1 lst = match lst with
    [] -> []
  | first :: rest ->
    if is_mod3_1 first then first :: filter_mod3_1 rest
                        else filter_mod3_1 rest
