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

(* 17.3 再帰的なデータ構造に対するデザインレシピ *)

(* 木を表す型 *)
type tree_t = Empty
            | Leaf of int
            | Node of tree_t * int * tree_t ;;

(* 木の例 *)
let tree1 = Empty ;;
let tree2 = Leaf (3) ;;
let tree3 = Node (tree1, 4, tree2) ;;
let tree4 = Node (tree2, 5, tree3) ;;

(* 目的 : treeに含まれる整数をすべて加える *)
(* sum_tree : tree_t -> int *)
let rec sum_tree tree = 0 ;;

(* テスト *)
let test1 = sum_tree tree1 = 0 ;;
let test2 = sum_tree tree2 = 3 ;;
let test3 = sum_tree tree3 = 7 ;;
let test4 = sum_tree tree4 = 15 ;;

(* 目的 : treeに含まれる整数をすべて加える *)
(* sum_tree : tree_t -> int *)
let rec sum_tree tree = match tree with
    Empty -> 0
  | Leaf (n) -> n
  | Node (t1, n, t2) -> sum_tree t1 + n + sum_tree t2 ;;

(* 17.4 2分探索木 *)

(* 目的 : dataが2分探索木treeに含まれているかを調べる *)
(* search : tree_t -> int -> bool *)
let rec search tree data = false ;;

(* 2分探索木の例 *)
let tree1 = Empty ;;
let tree2 = Leaf (3) ;;
let tree3 = Node (Leaf (1), 2, Leaf (3)) ;;
let tree4 = Node (Empty, 7, Leaf (9)) ;;
let tree5 = Node (tree3, 6, tree4) ;;

(* テスト *)
let test1 = search tree1 3 = false ;;
let test2 = search tree2 3 = true ;;
let test3 = search tree2 4 = false ;;
let test4 = search tree5 6 = true ;;
let test5 = search tree5 2 = true ;;
let test6 = search tree5 1 = true ;;
let test7 = search tree5 4 = false ;;
let test8 = search tree5 7 = true ;;
let test9 = search tree5 8 = false ;;

(* 目的 : dataが2分探索木treeに含まれているかどうかを調べる *)
(* search : tree_t -> int -> bool *)
let rec search tree data = match tree with
    Empty -> false
  | Leaf (n) -> data = n
  | Node (t1, n, t2) ->
      if data = n then true
      else if data < n then search t1 data
      else search t2 data ;;

(* 目的 : 2分探索木treeにdataを追加した2分探索木を返す *)
(* insert_tree : tree_t -> int -> tree_t *)
let rec insert_tree tree data = Empty ;;

(* テスト *)
let test1 = insert_tree Empty 3 = Leaf (3) ;;
let test2 = insert_tree (Leaf (3)) 2 = Node (Leaf (2), 3, Empty) ;;
let test3 = insert_tree (Leaf (3)) 3 = Leaf (3) ;;
let test4 = insert_tree (Leaf (3)) 4 = Node (Empty, 3, Leaf (4)) ;;
let test5 = insert_tree tree5 4 = Node (Node (Leaf (1), 2, Node (Empty, 3, Leaf (4))),
                                        6,
                                        Node (Empty, 7, Leaf (9))) ;;

(* 目的 : 2分探索木treeにdataを追加した2分探索木を返す *)
(* insert_tree : tree_t -> int -> tree_t *)
let rec insert_tree tree data = match tree with
    Empty -> Leaf (data)
  | Leaf (n) -> if data = n then Leaf (n)
                else if data < n then Node (Leaf (data), n, Empty)
                else Node (Empty, n, Leaf (data))
  | Node (t1, n, t2) ->
    if data = n then Node (t1, n, t2)
    else if data < n then Node (insert_tree t1 data, n, t2)
    else Node (t1, n, insert_tree t2 data) ;;

(* 17.5 多相型の宣言 *)

(* 多層の木を表す型 *)
type 'a tree_t = Empty
               | Leaf of 'a
               | Node of 'a tree_t * 'a * 'a tree_t ;;

search ;;
insert_tree ;;

type ('a, 'b) tree_t =
    Empty
  | Leaf of 'a * 'b
  | Node of ('a, 'b) tree_t * 'a * 'b * ('a, 'b) tree_t ;;

(* 17.6 停止性 *)
