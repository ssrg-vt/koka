/*
Focus points:
  - global variable
  - builtin functions (__sync_fetch_and_add)
*/

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

// Mutable global variables are not supported in koka
// Could support: val data : ref<int> = 3
var counter = 0

pub sec "xdp" fun packet_count(ctx : ref<xdp_md>) : int {
  bpf_printk(counter) // should this require console effect
  sync_fetch_and_add(counter, 1) // functions cannot begin with `_` in koka
  return XDP_PASS
}

val license sec "license" = "Dual BSD/GPL"

// Alternative syntax ideas for license
//
// val license @sec("license") = "Dual BSD/GPL"
// val @sec("license") license = "Dual BSD/GPL"
// @license("Dual BSD/GPL")
