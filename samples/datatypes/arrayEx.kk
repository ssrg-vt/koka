module arrayEx

import std/core/types
import std/core/array
import std/core/vector

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
