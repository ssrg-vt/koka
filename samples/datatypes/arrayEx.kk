module arrayEx

import std/core/array
import std/num/int32

/*
pub fun get_len (a : vector<int>) : int {
  length(a)
}

pub fun get_len_arr (a : arrayty<int,n>) : int {
  val r = capacity(a)
  return r
}
pub fun main ()  {
  val v = vector(5, 2)
  val l = get_len(v)
  println("Hi from vector of length " ++ l.show)
}
*/

fun main()
  with-array fn(arr)
    for(2) fn(i)
      arr.set(i.int32, (i * 3).int32)
      ()
    for(2) fn(i)
      arr.get(i.int32).println
    ()