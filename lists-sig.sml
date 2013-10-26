signature PROBLEMS99 =
sig
    exception EmptyList
    exception BadNum of int
    val last_item : 'a list -> 'a option
    val penultimate : 'a list -> 'a option
    val nth_item : 'a list * int -> 'a option
    val size : 'a list -> int
    val reverse : 'a list -> 'a list
    val is_palindrome : ''a list -> bool
    val flatten : 'a list list -> 'a list
    val compress : ''a list -> ''a list
    val pack : ''a list -> ''a list list
    val encode : ''a list -> (''a * int) list
    val encode_modified : ''a list -> (''a*int) list
    val decode : ('a * int) list -> 'a list
    val duplicate : 'a list -> 'a list
    val duplicateN : int * 'a list -> 'a list
    val drop : int * 'a list -> 'a list
    val split : 'a list * int -> 'a list list
    val slice : int * int * 'a list -> 'a list
    val rotate : 'a list * int -> 'a list
    val remove_at : 'a list * int -> 'a list
    val insert_at : 'a * 'a list * int -> 'a list
    val range : int * int -> int list
    val rnd_select : ''a list * int -> ''a list
    val rnd_select_range : int * int -> int list
    val combination : int * 'a list -> 'a list list
    val quicksort : 'a list list -> 'a list list
    val lsort : 'a list list -> 'a list list
    val lfsort : 'a list list -> 'a list list
end
    

