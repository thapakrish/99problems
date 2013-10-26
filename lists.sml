(*
Author@Krishna

Problems from https://sites.google.com/site/prologsite/prolog-problems/1

Instead of built in functions, I'll be using recursion, let expressions, and pattern matching as much as possible.

*)

structure PrologLists :> PROBLEMS99 =
struct

exception EmptyList
exception BadNum of int

(*1.01*)

fun last_item (lst) =
    case lst of
	[]=> raise EmptyList
      | xs::[] => SOME xs
      | xs::ys => last_item(ys)

(*1.02*)

fun penultimate (lst) =
    case lst of
	[]=> raise EmptyList
      | xs::[] => NONE
      | xs::ys::[] => SOME xs
      | xs::ys::zs => penultimate(ys::zs)

(*1.03*)
				       
fun nth_item (lst, n) =
    case (lst, n) of
	([],num) => raise Empty
      | (xs::ys, 1) => SOME xs
      | (xs::ys, num) => nth_item(ys, num-1)

(*1.04*)

fun size (lst) =
    case lst of
	[]=> 0
      | xs::ys => 1 + size (ys)

(*1.05*)

fun reverse (lst) =
    case lst of
	[]=> []
      | xs::ys => reverse(ys) @ [xs]

(*helper function to avoid polyEqual warnings*)
fun equals (a,b) =
    a=b

(*1.06*)

fun is_palindrome (lst) =
    equals(lst, reverse(lst))

(*1.07*)

fun flatten (lst) =
    let fun unpack (lsts) =
		 case lsts of
		     []=> []
		   | x::y => x :: unpack y
    in
	case lst of
	    []=> []
	  | xs::ys => unpack xs @ flatten ys
    end

(*1.08*)

fun compress (lst) =
    case lst of
	[]=> []
      | xs::ys::zs => if equals (xs, ys) then compress (ys::zs)
		      else xs::compress(ys::zs)
				       
      | xs::ys => xs::compress(ys)


fun compress2 (lst) =
    let fun compare (from, to) =
	    case from of
		[]=> []
	      | xs::ys => if equals(xs, to) then compare(ys, to)
			  else xs :: compress2(ys)
    in
	if null lst then [] else
	compare(lst, hd lst)
    end

(*1.09*)

fun pack (lst) =
    let fun compare (from,to,acc) =
	    case from of
		[]=> acc::[]
	      | xs::ys => if equals(xs, to) then compare (ys, xs, to::acc)
			  else acc::compare (ys,xs,[xs])
    in
	if null lst then []
	else compare (lst, hd lst,[])
    end 
		

(*1.10*)
fun encode (lst) =
    let fun compare (from, to, count) =
	    case from of
		[]=> [(to,count)]
	      | xs::ys => if equals (xs, to) then compare (ys, to, count+1)
			  else [(to, count)] @ encode(xs::ys) 
    in
	if null lst then []
	else compare (lst, hd lst, 0)
    end

(*1.11*)

fun encode_modified (lst) =
    let fun traverse (packed_list) = 
	    case packed_list of
		[]=> []
	      | xs::ys => (hd xs, size xs):: traverse ys
    in
	traverse (pack lst)
    end



(*helper function*)
fun repeat (item, count) =
	if count = 0 then []
	else item::repeat(item, count-1)

(*1.12*)

fun decode (lst) =
    case lst of
	[]=> []
      | xs::ys => repeat xs @decode(ys)


(*1.14*)

fun duplicate (lst) =
    case lst of
	[]=> []
      | xs::ys => xs::[xs]@duplicate(ys)

(*1.15*)

fun duplicateN (N,lst) =
    case (N, lst) of
	(_,[])=>[]
      | (num, xs::ys) => repeat(xs, num)@duplicateN(num, ys)

(*1.16*)

fun drop (N, lst) =
    let fun helper ( M, sth) =
	    case sth of
		[]=> []
	      | xs::ys => if M = 0 then xs :: drop (N, ys)
			  else helper (M-1,ys)
    in
	helper(N, lst)
    end


(*1.17*)
(*TODO::edit it for N = 0*)

fun split (lst, N) =
    let fun dissect (sth, acc, M) =
	    case sth of
		[]=>[]
	      | xs::ys => if M > 0 then dissect (ys, acc@[xs], M-1)
			  else [acc] @ [sth]
    in
	if null lst then []
	else dissect (lst, [], N)
    end



(*1.18*)

fun slice (n1,n2,lst) =
    if null lst then []						 
    else if n1 > 1 then slice(n1-1,n2-1,tl lst)
    else let fun chop (n2, sth) =
		 if n2 < 1 then []
		 else hd sth :: chop (n2-1, tl sth)
	 in
	     chop(n2,lst)
	 end

	     
(*1.19*)

fun rotate (lst, N) =
    let fun shift_items (M, sth, acc) =
	    case sth of
		[]=>[]
	      | xs::ys => if M > 0 then shift_items (M-1, ys, acc@[xs])
			  else sth@acc
    in
	if N = 0 then lst
	else shift_items (N, lst, [])
    end


(*1.20*)
	
fun remove_at (lst, N) =
(*
    if N < 1 then raise BadNum (N)
*)
    case lst of
	[]=> []
      | xs::ys => if N > 1 then xs:: remove_at(ys, N-1)		  
		  else ys
			       
	
(*1.21*)

fun insert_at (alpha, lst, N) =
    case lst of
	[]=> if N = 1 then [alpha] else []
      | xs::ys => if N > 1 then xs :: insert_at(alpha, ys, N-1)
		  else alpha :: lst
				    
				 
(*1.22*)

fun range (num1, num2) =
    if num1<num2 then num1::range(num1+1,num2)
    else [num2]

(*1.23*)

fun rnd_select (lst, num) =
    let
	val x = Random.rand(num, size lst)
	val y = Random.randRange (1, size lst) x
	val item = valOf(nth_item(lst, y))
    in
	if num > 0 then
	    item :: rnd_select(List.filter(fn x=> x <> item) lst, num-1)
	else []
    end	

(*1.24*)
fun rnd_select_range (low, high) =
    let
	val lst = range(low, high)
    in
	rnd_select(lst, high-low)
    end


(*1.26*)
fun combination (num, lst) =
    case (num,lst) of
	(0,_) =>[[]]
      | (_,[]) => []
      | (m,x::xs) => map (fn y => x::y) (combination (m-1,xs)) @ combination(m,xs)

(*1.27
Multinomial coefficients
*)


(*helper function for sorting*)
fun quicksort (lst) =
    case lst of
	[] => []
      | hd::[] => [hd]
      | pivot::rest => let
	  val (left, right) = List.partition (fn x => size(x) < size(pivot)) rest
      in
	  quicksort left @ [pivot] @ quicksort right
      end

(*1.28a*)
fun lsort (lnlist) =
    quicksort(lnlist)
	
(*helper functions for 1.28b*)

fun count (item,lst,acc) =
    case lst of
	[]=> acc
      | xs::ys => if item = xs then count(item, ys, acc+1)
		  else count(item, ys, acc)

fun delete (item, lst) =
    if null lst then []
    else if item = hd lst
    then delete(item, tl lst)
    else hd(lst)::delete(item, tl lst)

fun strip_duplicates (lst) =
    case lst of
	[]=>[]
      | xs::ys => xs::strip_duplicates(delete(xs,ys))

fun size_it (lst) =
	    case lst of
		[]=> []
	      | xs::ys => List.length(xs)::size_it(ys)	

fun quicksort_tuple (lst):(int*int) list =
    case lst of
	[] => []
      | hd::[] => [hd]
      | pivot::rest => let
	  val (left, right) = List.partition (fn x => #2 x < #2 pivot) rest
      in
	  quicksort_tuple left @ [pivot] @ quicksort_tuple right
      end

fun loop_given_list (num,lst1) =
    case lst1 of
	[]=>[]
      | xs::ys => if num = List.length(xs) then xs::loop_given_list(num,ys)
		  else loop_given_list(num,ys)

fun frequency_lists (lst1,lst2) =		    
    case lst1 of
	[]=> []
      | xs::ys => (xs,count(xs,lst2,0))::frequency_lists(ys,lst2)

(*1.28b*)

(* Most likely a overkill.
a)->get the sizes of the list
b)->get unique sizes
c)->get frequency by comparing a, and b.
d)->quicksort by frequency
e)->compare #2 of each tuple and sort return lists accordingly
*)				      
fun lfsort (lnlist)=
    let
	val list_sizes = size_it (lnlist)
	val list_unique_sizes = strip_duplicates(list_sizes)
	val freq_tuples = frequency_lists (list_unique_sizes, list_sizes)
	val quic = quicksort_tuple(freq_tuples)
	val sorted_size_list = List.map(fn x=> #1 x) quic

    in
	let fun loop_through_ssl (lst) =
		case lst of
		    []=> []
		  | xs::ys => loop_given_list (xs, lnlist)@loop_through_ssl(ys)
	in
	    loop_through_ssl(sorted_size_list)
	end
    end


end
