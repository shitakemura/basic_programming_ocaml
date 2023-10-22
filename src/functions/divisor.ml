(* 目的 : nから1までのリストを作る *)
let rec enumurate n =
  if n = 0 then []
  else n :: enumurate (n - 1)

(* 目的 : nの約数のリストを返す *)
let divisor n = List.filter (fun x -> n mod x = 0) (enumurate n)

(* 目的 : m以下の完全数のリストを返す *)
let perfect m =
  List.filter(fun n -> List.fold_right (+) (divisor n) 0 - n = n) (enumurate m)