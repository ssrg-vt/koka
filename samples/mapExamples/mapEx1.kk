module mapEx1

import std/core/list


pub fun main() {
  val xs = list(1, 5)
  val result = increment_list(xs)
  println ("The incremented list is " ++ result.show)
}

fun increment (x : int) : int {
  return (x + 1)
}

fun increment_list (ls : list<int>) : list<int> {
    val result = ls.map(fn(x) increment(x))
    return result
}

fun example1() {
  map( list(1,5), fn(i){ println(i) } )
}


