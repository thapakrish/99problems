(*
Problems from https://sites.google.com/site/prologsite/prolog-problems/2

Not the most efficient is_prime algorithm, but it'll do here.
*)

structure ProLogArith :> PROBLEMS99 =
struct

(*2.01*)

fun is_prime (n) =
    let fun not_divisible(m) =
	    if n mod m = 0 then false
	    else if m*m >= n then true
	    else not_divisible(m+2)
    in
	if n < 2 then raise Domain
	else if 6 mod n = 0 then true
	else if n mod 2 = 0 then false
	else not_divisible(3)
    end


(*2.02*)

fun primes_below (n) =
    let fun check (m, acc) =
	if m > n then acc
	else if is_prime m then check(m+2, acc@[m])
	else check(m+2,acc)
    in
	check (3, [2])
    end

fun prime_factors (n) =
    let fun spit_factors (lst) =
	    case lst of
		[]=> []
	      | xs::ys => if n mod xs = 0 then xs::prime_factors(n div xs)
			  else spit_factors (ys)
    in
	spit_factors(primes_below(n))
    end	


(*2.03*)

fun prime_factors_mult (n) =
    let 
	val primes = prime_factors (n)
    in
	let fun primes_mult (primes_lst, prime, count) =
		case primes_lst of
		    []=> [[prime, count]]
		  | xs::ys => if xs = prime then primes_mult (ys, prime, count+1)
			      else [[prime, count]]@primes_mult (ys, xs, 1)
	in
	    primes_mult (primes, hd primes, 0)
	end
    end

(*helper function*)

fun is_in (item, lst) =
	    case lst of
		[]=> false
	      | xs::ys => if xs = item then true
			  else is_in (item, ys)
				      
(*helper function*)

fun difference (lista, listb) =
    case lista of
	[]=>[]
      | xs::ys => if is_in (xs, listb) then difference (ys, listb)
		  else xs::difference(ys, listb)


(*2.04*)

fun primes_between (below, upper) =
    let 
	val bp = primes_below (below)
	val up = primes_below (upper)
    in 
	difference (up, bp)
    end

(*2.05 Goldbach's conjecture*)
(*Wow, this works! Awesome!!!*)

fun goldbach (num) =
    let
	val possible_primes = primes_below(num)
    in
	let fun check (N, pp , acc) =
		case pp of
		    []=> check (N, possible_primes, acc+1)
		  | xs::ys => if is_prime (acc) andalso (xs+acc = N) then [xs,acc]
			      else check (N, ys, acc)
	in
	    check (num, possible_primes,2)
	end
    end	    

(*2.06*)

fun goldbach_list (lower, upper) =	    
    if lower <=upper then
	goldbach (lower) :: goldbach_list(lower+2, upper)		 
    else []

(* 2.07*)

fun gcd (m,n) =
    if m=n then m
    else if m < n
    then gcd(m,n-m)
    else gcd(n,m)	    

(*2.08*)

fun coprime (a, b) =
    gcd (a,b) = 1

(*2.09*)

fun phi (m) =
    let fun totient_phi (n1, n2) =
	    if n1<=n2 then
		if gcd(n1,n2)=1 then 1 + totient_phi (n1+1,n2)
		else 0 + totient_phi (n1+1,n2)
	    else 0
    in
	totient_phi(1,m)
    end

(*2.10*)
(*helper function*)
fun power (num, n) =
    if n = 0 then 1
    else num * power(num, n-1)

fun totient_phi (num) =
    let fun  multiply_phi (lst) =
	     case lst of	   
	       [a,b]::ys => (a-1) * power(a , b -1) * multiply_phi(ys)
	      | _ => 1
    in
	multiply_phi(prime_factors_mult(num))
    end

(*2.11
Use a timer
*)

end
