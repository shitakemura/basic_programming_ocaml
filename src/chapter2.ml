(* 第2章 基本的なデータ *)

(* 2.1 整数 *)
3 ;;
3 + 4 * 2 ;;
(3 + 4) * 2 ;;
2 - 3 ;;
7 / 2 ;;
7 mod 2 ;;

(* 2.2 実数 *)
2.718 ;;
(3.0 +. 5.0) *. 8.0 /. 3.0 ;;
(3. +. 5.) *. 8. /. 3. ;;
1.41421356 ** 2.0 ;;

infinity ;;
infinity +. 3.0 ;;
2.0 /. infinity ;;

neg_infinity ;;
3.0 -. infinity ;;

(* 2.3 文字列 *)
"Yokohama" ;;
"横浜" ;;
"横浜" ^ "駅" ;;
"新" ^ "横浜" ^ "駅" ;;

"" ;;

(* 2.4 真偽値 *)
true ;;
false ;;

true && true ;;
true && false ;;
true || false ;;
false || false ;;

not true ;;
not false ;;
not (false || not false && not false) ;;

2 < 3 ;;
2 < 3 && 2.0 = 3.0 ;;
2 < 3 || 2.9 = 3.0 ;;
not (3 < 2) ;;

true > false ;;
false > true ;;
true > true ;;

(* 2.5 そのほかのデータ *)

(* 組、レコード、リスト、木など *)