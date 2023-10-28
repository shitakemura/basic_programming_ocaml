(* 第18章 例外と例外処理 *)

(* 18.1 オプション型 *)
(* 'a型の値があるか値がないかのどちらかの型 *)
type 'a option = None
                | Some of 'a ;;

(* 八百屋に置いてある野菜と値段のリストの例 *)
let yaoya_list = [("トマト", 300); ("たまねぎ", 200); ("にんじん", 150); ("ほうれん草", 200)] ;;

(* 目的 : itemの値段を調べる *)
let rec price item yaoya_list = match yaoya_list with
    [] -> None
  | (yasai, nedan) :: rest ->
      if item = yasai then Some (nedan)
                      else price item rest ;;

price "トマト" yaoya_list ;;
price "ジャガイモ" yaoya_list ;;

(* 18.2 オプション型を使った例外処理 *)

(* 目的 : yasai_listを買ったときの値段の合計を調べる *)
let rec total_price yasai_list yaoya_list = match yasai_list with
    [] -> 0
  | first :: rest ->
    match price first yaoya_list with
        None -> total_price rest yaoya_list
      | Some (p) -> p + total_price rest yaoya_list ;;

(* 18.3 オプション型を使った例外処理の問題点 *)

(* 目的 : yasai_listを買ったときの値段の合計を調べる *)
let rec total_price yasai_list yaoya_list = 
  match yasai_list with
      [] -> Some (0)
    | first :: rest ->
        match price first yaoya_list with
            None -> None
          | Some (p) -> match total_price rest yaoya_list with
                            None -> None
                          | Some (q) -> Some (p + q) ;;

(* オプション型を使った例外処理の例 *)
(* 目的 : yasai_listを買ったときの値段の合計を調べる *)
let total_price yasai_list yaoya_list =
  let rec hojo yasai_list = match yasai_list with
      [] -> Some (0)
    | first :: rest ->
        match price first yaoya_list with
            None -> None
          | Some (p) -> match hojo rest with
                            None -> None
                          | Some (q) -> Some (p + q)
  in match hojo yasai_list with
      None -> 0
    | Some (p) -> p ;;

