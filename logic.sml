(*
Problems from https://sites.google.com/site/prologsite/prolog-problems/3
*)

datatype exp = Var of string 
	     | Not of exp
	     | And of exp * exp
	     | Or of exp * exp

fun eval e =
    case e of
	Var x => true
      | Not e1 => not (eval e1)
      | And (e1, e2) =>  (eval e1) andalso (eval e2)
      | Or (e1, e2) => (eval e1) orelse (eval e2)

(* testing::

val val1 = Var "x"
val val2 = Not(Var "y")
val and1 = And(Var "x", Var "y")
val and2 = And(Var "x", Not (Var "y"))
val and3 = And(Not (Var "x"), Not (Var "y"))
val or1 = Or(Var "x", Not (Var "y"))
val or2 = Or (Not (Var "x"), Not (Var "y"))
val or3 = Or (Var "x", Var "y")

val eval_val1 = eval val1
val eval_val2 = eval val2
val eval_and1 = eval and1
val eval_and2 = eval and2
val eval_and3 = eval and3
val eval_or1 = eval or1
val eval_or2 = eval or2
val eval_or3 = eval or3
*)

(*3.01*)


fun table1 (a:exp, b:exp, operator) = 
    let fun rt(m,n) =
	    let val expr = operator(m,n)
	    in
		[eval m, eval n, eval expr]
(*
		(Bool.toString(eval m), Bool.toString(eval n),Bool.toString(eval expr))
*)
	    end
    in

	[rt(a,b),
	 rt(Not(a),b), 
	 rt(a, Not(b)), 
	 rt(Not(a), Not(b))]

    end

(*example*)	    
val x_and1 = table1 (Var "x", Var "x", And);
val x_and2 = table1 (Var "x", Not(Var "x"), And);
val y_or = table1 (Var "x", Var "x", Or);
