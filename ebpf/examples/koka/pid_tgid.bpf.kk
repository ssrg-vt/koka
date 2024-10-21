/*
Focus points:
  - void context
	- bpf_printk with multiple arguments (variadic function)
*/

/*
https://github.com/libbpf/libbpf-bootstrap/blob/master/examples/c/minimal.bpf.c

// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
/* Copyright (c) 2020 Facebook */
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

char LICENSE[] SEC("license") = "Dual BSD/GPL";

uint64_t my_pid = 0;

SEC("tp/syscalls/sys_enter_write")
int handle_tp(void *ctx)
{
	// bit shift to pull out tgid
	uint64_t pid = bpf_get_current_pid_tgid() >> 32;

	if (pid != my_pid)
		return 0;

	bpf_printk("BPF triggered from PID %d.\n", pid);

	return 0;
}
*/

import bpf/bpflib/bpf
import bpf/bpflib/bpf_helpers
import std/num/int64

val my_pid : int.int64 = 0

pub sec "tp/syscalls/sys_enter_write" fun handle_tp(ctx : void) {
  val key = 0
 	
	// bit shift to pull out tgid
	// koka does not have bit shift operator but can devide or use shl
	val pid : int = bpf_get_current_pid_tgid() / 2^32;

  if pid != my_pid
    then return 0

	bpf_printk("BPF triggered from PID %d.\n", pid);

  return 0
}

val license sec "license" = "Dual BSD/GPL"
