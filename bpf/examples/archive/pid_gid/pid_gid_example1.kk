/* C code 
// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
/* Copyright (c) 2020 Facebook */
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

char LICENSE[] SEC("license") = "Dual BSD/GPL";

int my_pid = 0;

SEC("tp/syscalls/sys_enter_write")
int handle_tp(void *ctx)
{
	int pid = bpf_get_current_pid_tgid() >> 32;

	if (pid != my_pid)
		return 0;

	bpf_printk("BPF triggered from PID %d.\n", pid);

	return 0;
} */

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
    //bpf_printk(pid)
    return pid.int
}

pub fun main() {
  handle_tp()
}