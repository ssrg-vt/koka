module practice

import std/num/int32

fun fib(n : int) : div int
  if n <= 0   then 0
  elif n == 1 then 1
  else fib(n - 1) + fib(n - 2)

fun fib2(n) : int
  var x := 0
  var y := 1
  repeat(n)
    val y0 = y
    y := x+y
    x := y0
  x

// Termination 
fun hello_ten()
  var i := 0
  while { i < 10 }
    println("hello")
    i := i + 1

fun hello_nt(): <console/console,div> ()
  while { True }
    println("hello")


fun compute(x : int32) : <console/console,div> ()
  var r := x
  while { r != 5.int32 } {
    println("hello")
    r := r + 1.int32
  }

fun compute2(x : ref<h,int32>) : <console/console,div,read<h>> ()
  var r := !x
  while { r != 5.int32 } {
    println("hello")
    r := r + 1.int32
  }

fun compute3(x: ref<h,int32>, n : int32) : <console/console,div,read<h>> ()
  var r := !x
  while { r != n } {
    println("hello")
    r := r + 1.int32
  }

fun main() 
  hello_ten()
  hello_nt()
  compute2(ref(6.int32))
  compute3(ref(6.int32), 5.int32)
  compute(6.int32)