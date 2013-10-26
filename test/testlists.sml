
CM.make "../lists-sig.sml";


val last1 = PrologLists.last_item [1,2,3] = SOME 3
val last2 = PrologLists.last_item ["a","b"] = SOME "b"
val last3 = PrologLists.last_item ["a","b","c"] = SOME "c"

val penultimate1 = PrologLists.penultimate [1,2,3] = SOME 2
val penultimate2 = PrologLists.penultimate ["a","b"] = SOME "a"
val penultimate3 = PrologLists.penultimate ["a","b","c"] = SOME "b"

val nth1 = PrologLists.nth_item ([1,2,3],1) = SOME 1
val nth2 = PrologLists.nth_item (["a","b"],2) = SOME "b"
val nth3 = PrologLists.nth_item (["a","b","c"],3) = SOME "c"

val palin1 = PrologLists.is_palindrome [1,2,3] = false;
val palin2 = PrologLists.is_palindrome [1,2,1]= true;
val palin3 = PrologLists.is_palindrome [1] = true;
val palin4 = PrologLists.is_palindrome [] = true;

val comp1 = PrologLists.compress [1,1,2,3,3,3,3,4,5] = [1,2,3,4,5];
val comp2 = PrologLists.compress [1,2,5]= [1,2,5];
val comp3 = PrologLists.compress [1]= [1];
val comp4 = PrologLists.compress [1,1,2,2,1,1,3]= [1,2,1,3];

val sz1 = PrologLists.size [] = 0;
val sz2 = PrologLists.size [1] = 1;
val sz3 = PrologLists.size ["a","e","i","o","u"] = 5;

val rev1 = PrologLists.reverse [] = [];
val rev2 = PrologLists.reverse [1,2,3] = [3,2,1];
val rev3 = PrologLists.reverse [1] = [1];
val rev4 = PrologLists.reverse ["a","e","i","o","u"] = ["u","o","i","e","a"];

val flat1 = PrologLists.flatten [] = [];
val flat2 = PrologLists.flatten [[1]] = [1];
val flat3 = PrologLists.flatten [[1],[2,3],[4,5,6]] = [1,2,3,4,5,6];

val encode1 = PrologLists.encode [] = [];
val encode2 = PrologLists.encode [1] = [(1,1)];
val encode3 = PrologLists.encode [1,2,2,3,3,3,4,4,4,4,5,5,6]= [(1,1),(2,2), (3,3),(4,4),(5,2),(6,1)]

val decode1 = [1] = PrologLists.decode (PrologLists.encode [1]);
val decode2 = ["a","b","c"]= PrologLists.decode (PrologLists.encode ["a","b","c"]);
val decode3 = [1]= PrologLists.decode (PrologLists.encode [1]);

val dupli1 = PrologLists.duplicate [1] = [1,1];
val dupli2 = PrologLists.duplicate ["a","b"] = ["a","a","b","b"]

val dupliN1 = PrologLists.duplicateN (1, [2]) = [2];
val dupliN2 = PrologLists.duplicateN (2, [2]) = [2,2];
val dupliN3 = PrologLists.duplicateN (3, [1,2,3]) = [1,1,1,2,2,2,3,3,3];

val drop1 = PrologLists.drop(0,["a","e","i","o","u"]) = ["a","e","i","o","u"];
val drop2 = PrologLists.drop(1, [1,2,3,4]) = [2,4];
val drop3 = PrologLists.drop (2, [1,2,3,4]) = [3];
val drop4 = PrologLists.drop (4, [1,2,3,4]) = [];

val split1 = PrologLists.split ([],1) = [];
val split2 = PrologLists.split ([5,4,3,2,1],2) = [[5,4],[3,2,1]];
val split3 = PrologLists.split (["a","e","i","o","u"],3) = [["a","e","i"],["o","u"]];
val split4 = PrologLists.split (["nth","changes"],0) = [[],["nth","changes"]];

val slice1 = PrologLists.slice (3,3,[2,4,6,8]) = [6];
val slice2 = PrologLists.slice (3,6,["a","b","c","d","e","f","g","h"])=["c","d","e","f"];
val slice3 = PrologLists.slice (1,2,[]) = [];

val rotate1 = PrologLists.rotate (["a","b","c","d","e","f","g","h"],3)=["d","e","f","g","h","a","b","c"]; 
val rotate2 = PrologLists.rotate ([],3)=[];
val rotate3 = PrologLists.rotate ([1,2,3],0) = [1,2,3];

val remove_at1 = PrologLists.remove_at([1,2,3,4,5],3) = [1,2,4,5];
val remove_at2 = PrologLists.remove_at([1,2,3,4,5],1) = [2,3,4,5];
val remove_at3 = PrologLists.remove_at(["a","b","c"],3) = ["a","b"];
val remove_at4 = PrologLists.remove_at([],4) = []

val insertat1 = PrologLists.insert_at ("a",["e","i","o","u"],1) =  ["a","e","i","o","u"];
val insertat2 = PrologLists.insert_at (2,[8,6,4],4) = [8,6,4,2];
val insertat3 = PrologLists.insert_at (1, [],1) = [1];

val range1 = PrologLists.range(0,5) = [0,1,2,3,4,5];
val range2 = PrologLists.range (10,12) = [10,11,12];

