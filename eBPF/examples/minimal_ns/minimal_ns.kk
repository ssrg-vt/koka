// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
/* Copyright (c) 2023 Hosein Bakhtiari 
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/sched.h>

char LICENSE[] SEC("license") = "Dual BSD/GPL";

int my_pid = 0;
unsigned long long dev;
unsigned long long ino;

SEC("tp/syscalls/sys_enter_write")
int handle_tp(void *ctx)
{
	struct bpf_pidns_info ns;

	bpf_get_ns_current_pid_tgid(dev, ino, &ns, sizeof(ns));
	if (ns.pid != my_pid)
		return 0;

	bpf_printk("BPF triggered from PID %d.\n", ns.pid);

	return 0;
} */

import eBPF/bpflib/bpf_helpers
import eBPF/bpflib/bpf
import std/num/int32
import std/num/int64
import std/core/console

// https://github.com/libbpf/libbpf-bootstrap/blob/master/examples/c/minimal_ns.bpf.c#L16

val my_pid = 0.int32
val dev = 0.int64
val ino = 0.int64

pub sec "tp/syscalls/sys_enter_write" fun handle_tp() {
  val ns = Bpf_pidns_info(0.int32, 0.int32)
  val n = bpf_get_ns_current_pid_tgid(dev, ino, ref(ns), sizeof(ns))
  if (ns.pid) != my_pid then
   return 0.int32 
  else 
    //bpf_printk(pid)
   return ns.pid
}

/*
pub fun main() {
  handle_tp()
}*/