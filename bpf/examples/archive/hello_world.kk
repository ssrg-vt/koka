module eBPF/examples/hello_world

import std/num/int32
import std/core/string
import std/core/console

/*
pub sec "tracepoint/syscalls/sys_enter_execve" fun hello_world() {
  val s = "Hello World"
  //println("Check printing in tracepoint: " ++ s.show)
  bpf_printk(s);
}

pub fun main() {
  hello_world()
}*/

