module eBPF/bpflib/bpf_helpers

import std/num/int64
import std/num/int32
import eBPF/bpflib/bpf

/*
extern import 
  c file "../src/bpfprintk.c"

pub extern int32/bpf_printk(a : int32) : io ()
  c inline "kk_printf_int32(#1)"

pub extern int64/bpf_printk(a : int64) : io() 
  c inline "kk_printf_int64(#1)" */

/* u64 bpf_get_current_uid_gid(void)
   Description : Get the current uid and gid.
   Return A 64-bit integer containing the current GID and UID, 
    and created as such: current_gid << 32 | current_uid. */
pub extern bpf_get_current_uid_gid () : int64
  c inline "bpf_get_current_uid_gid()"

/* u64 bpf_get_current_pid_tgid(void)
   Description : Get the current pid and tgid.
   Return A 64-bit integer containing the current tgid and pid, 
     and created as such: current_task->tgid << 32 | current_task->pid. */
pub extern bpf_get_current_pid_tgid () : int64
  c inline "bpf_get_current_pid_tgid()"

pub extern bpf_get_ns_current_pid_tgid (dev : int64, ino : int64, nsdata : ref<h,bpf_pidns_info>, size : int32) : int64 
  c inline "bpf_get_ns_current_pid_tgid(#1, #2, #3, #4)"




