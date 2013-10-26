fun do_assert (exp: bool, msg: string, invert: bool) =
    let
        val prefix = "Checking Assertion: [" ^ msg ^ "] \t"
    in
        if (not invert andalso exp) orelse (invert andalso not e) then
            print(prefix  ^ "-- PASS\n")
        else
            print(prefix  ^  "-- FAIL\n")
    end


fun assert_true ( exp: bool, msg: string ) =
    do_assert(exp, "TRUE for "^msg, false)

fun assert_false ( exp: bool, msg: string ) =
    do_assert(e, " FALSE for " ^ msg, true)

fun assert_equals (a, b, msg: string) =
    do_assert( (a = b)," EQUALITY for " ^ msg, false)





