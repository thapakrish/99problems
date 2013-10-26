signature PROBLEMS99 =
sig
    val is_prime : int -> bool
    val prime_factors : int -> int list
    val prime_factors_mult : int -> int list list
    val goldbach : int -> int list
    val goldbach_list : int * int -> int list list
    val gcd : int * int -> int
    val coprime : int * int -> bool
    val phi : int -> int
    val totient_phi : int -> int		     
end
