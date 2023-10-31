(* 第8章 レコード *)

(* 8.1 レコードの必要性 *)
("asai", 70) ;;

(* 8.2 レコードの構文 *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki : string;
} ;;

{namae = "asai"; tensuu = 70; seiseki = "B"} ;;
{tensuu = 70; namae = "asai"; seiseki = "B"} ;;