use "./assert.sml";
use "../lists.sml";

"Checking for last_item";
assert_equals(valOf(last_item [3]), 3, "Single item");
assert_equals(valOf(last_item [1,2,3,4]), 4, "Multiple items");
assert_equals(valOf(last_item ["a","b","c"]), "c", "With strings");
assert_true(valOf(last_item [3])=3, "Single item with true");
assert_false(valOf(last_item [3])=5, "Single item with false");


(*penultimate*)
assert_equals(valOf(penultimate [1,3]), 1, "Two item list");
assert_equals(valOf(penultimate [1,3,3]), 3, "Three item list");
assert_equals(valOf(penultimate ["a","b","c"]), "b", "With strings");
assert_equals(valOf(penultimate []), NONE, "single item");

(*nth_item*)
assert_equals(valOf(nth ([1]),1), 1, "single item");
assert_equals(valOf(nth ([1,2],2)), 2, "empty list");
assert_equals(valOf(nth []), NONE, "empty list");
