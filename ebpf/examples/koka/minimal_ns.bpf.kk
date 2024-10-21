/*
Focus points:
	- bpf struct
*/

/*
https://github.com/libbpf/libbpf-bootstrap/blob/master/examples/c/minimal_ns.bpf.c

// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
/* Copyright (c) 2023 Hosein Bakhtiari */
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/sched.h>

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
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";
*/

import bpf/bpflib/bpf
import bpf/bpflib/bpf_helpers

val my_pid = 0
var dev : int := 0
var ino : int := 0

pub sec "tp/syscalls/sys_enter_write" fun handle_tp(ctx : void) {

	var ns : ref<bpf_pidns_info> := Bpf_pidns_info(-1, -1)

	bpf_get_ns_current_pid_tgid(dev, ino, ns, sizeof(ns));
	if ns.pid != my_pid
		then return 0;

	bpf_printk("BPF triggered from PID %d.\n", ns.pid); // veriadic function
  return 0
}

val license sec "license" = "Dual BSD/GPL"
