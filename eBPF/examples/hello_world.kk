module eBPF/examples/hello_world

import std/num/int32
import std/core/string

//SEC("tracepoint/syscalls/sys/enter_execve")

fun hello_world() : console int {
  val msg = "Hello World!"
  println("invoke hello_world: " ++ msg)
  return 0
}

pub fun main() : console int {
  hello_world()
}
