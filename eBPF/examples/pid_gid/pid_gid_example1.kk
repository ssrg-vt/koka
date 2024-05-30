import eBPF/bpflib/bpf_helpers
import std/num/int64
import std/core/console

// https://github.com/libbpf/libbpf-bootstrap/blob/master/examples/c/minimal.bpf.c
val my_pid = 0.int64

pub sec "tp/syscalls/sys_enter_write" fun handle_tp() {
  val pid = shr(bpf_get_current_pid_tgid(), 32)
  if pid != my_pid then
   return 0 
  else 
    println("hello from pid_gid")
    return 0
}

pub fun main() {
  handle_tp()
}