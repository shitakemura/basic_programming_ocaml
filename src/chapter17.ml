(* 第17章 再帰的なデータ構造 *)

(* 17.1 バリアント型 *)

(* 赤組か白組かを表す型 *)
type team_t = Red | White ;;
Red ;;
White ;;

(* 目的 : 受け取ったチーム名を文字列で返す *)
(* team_setting : team_t -> string *)
let team_setting team = match team with
    Red -> "赤組"
  | White -> "白組" ;;

(* 年号を表す型 *)
type nengou_t = Meiji of int
              | Taisho of int
              | Showa of int
              | Heisei of int ;;

Showa (42) ;;

(* 目的 : 年号を受け取ったら対応する西暦年を返す *)
(* to_seireki nengou_t -> int *)
let to_seireki nengou = match nengou with
    Meiji (n) -> n + 1867
  | Taisho (n) -> n + 1911
  | Showa (n) -> n + 1925
  | Heisei (n) -> n + 1988 ;;

(* 17.2 木 *)

(* 木を表す型 *)
type tree_t = Empty
            | Leaf of int
            | Node of tree_t * int * tree_t ;;

Empty ;;
Leaf (3) ;;
Leaf (24) ;;

Node (Empty, 7, Leaf (3)) ;;

Node (Node (Empty, 7, Leaf (3)), 17, Leaf (24)) ;;
