module eBPF/examples/hello_world

import std/num/int32
import std/core/string
import std/core/console

//SEC("tracepoint/syscalls/sys/enter_execve")

fun hello_world() : console() {
  val msg = "Print Hello World!"
  bpf_printk("invoke hello_world: " ++ msg)
}

pub fun main() : console() {
  hello_world()
}
