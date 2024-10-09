// C program 
/* // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
/* Copyright (c) 2021 Sartura */
#include "vmlinux.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

char LICENSE[] SEC("license") = "Dual BSD/GPL";

SEC("fentry/do_unlinkat")
int BPF_PROG(do_unlinkat, int dfd, struct filename *name)
{
	pid_t pid;

	pid = bpf_get_current_pid_tgid() >> 32;
	bpf_printk("fentry: pid = %d, filename = %s\n", pid, name->name);
	return 0;
}

SEC("fexit/do_unlinkat")
int BPF_PROG(do_unlinkat_exit, int dfd, struct filename *name, long ret)
{
	pid_t pid;

	pid = bpf_get_current_pid_tgid() >> 32;
	bpf_printk("fexit: pid = %d, filename = %s, ret = %ld\n", pid, name->name, ret);
	return 0;
} */

import eBPF/bpflib/bpf_helpers
import std/num/int64
import std/core/console

// https://github.com/libbpf/libbpf-bootstrap/blob/master/examples/c/fentry.bpf.c

pub sec "fentry/do_unlinkat" fun prog1 (do_unlinkat, dfd : int, name : ref<struct filename>) {
  val pid = shr(bpf_get_current_pid_tgid(), 32)
  //bpf_printk("fentry: pid = %d, filename = %s\n", pid, name->name)
  return 0
}

pub sec "fexit/do_unlinkat" fun prog2 (do_unlinkat_exit, int dfd, struct filename *name, ret : long) {
  val pid = shr(bpf_get_current_pid_tgid(), 32)
  //bpf_printk("fexit: pid = %d, filename = %s, ret = %ld\n", pid, name->name, ret)
  return 0
}

