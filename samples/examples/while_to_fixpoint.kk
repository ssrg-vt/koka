module while_to_fixpoint

import std/num/int32

/* nat is a datatype representing natural numbers starting from 0 */
pub type nat
   con O
   con Succ(n : nat)

fun nat_to_int (n : nat) : int32 
 match n 
  O -> 0.int32
  Succ(n) -> (nat_to_int(n) + 1.int32)

/* Function we want to convert to an equivalent function defined over nat and not using while 
fun hello_ten()
  var i := 0
  while { i < 10 }
    println("hello")
    i := i + 1 */

fun hello_ten (i : nat, acc : list<string>) : div list<string>
 match i 
  O -> acc
  Succ(n) -> hello_ten(n,(["hello"] ++ acc))

fun main() {
  println(show(nat_to_int(Succ(Succ(Succ(O))))))
  println(show(hello_ten(Succ(Succ(O)),[])))
}
