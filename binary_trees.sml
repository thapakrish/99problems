(*
Problems from https://sites.google.com/site/prologsite/prolog-problems/4
*)

datatype 'a bt = Null | Node of 'a * 'a bt * 'a bt

val ex_bt= Node(1,Null,Node(2,Node(3,Null,Null),Null));

(*Istree not necessary. If given input isn't a bt, sml gives an error*)
(*
fun cbal_tree (num)=
    if 
*)
