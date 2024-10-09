/*
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

int counter = 0;

SEC("xdp")
int packet_count(void *ctx) {
    bpf_printk("%d", counter);
    __sync_fetch_and_add(&counter, 1);
    return XDP_PASS;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";
*/

import bpf/bpflib/bpf
import bpf/bpflib/bpf_helpers

// global variable not supported
var counter = 0 

pub sec "xdp" fun packet_count(ctx : xdp_md) {
  bpf_printk(counter)
  sync_fetch_and_add(counter, 1)
  return XDP_PASS
}

// variable names cannot start with capital letters which is not a problem
val license sec "license" = "Dual BSD/GPL"
