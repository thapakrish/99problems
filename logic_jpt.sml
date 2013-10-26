
exception ValueError

fun eval2 a val_a b val_b =
    Var x => if x = a then val_a
	     else if x = b then val_b
	     else raise ValueError
  | Not e => not(eval2 a val_a b val_b e)
  | And(e1,e2) => eval2 a val_a b val_b  e1 andalso eval2 a val_a b val_b e2
  | Or (e1,e2) => eval2 a val_a b val_b e1 orelse eval2 a val_a b val_b e2
							

