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

// Mutable global variables are not supported
var counter = 0

pub sec "xdp" fun packet_count(ctx : xdp_md) {
  bpf_printk(counter)
  sync_fetch_and_add(counter, 1) // functions cannot begin with `_` in koka
  return XDP_PASS
}

// By convention the license variable is typically `LICENSE` but in koka 
// variable names cannot start with capital letters. Thankfully bpftool does not
// care what the variable name is so long as there is a valid string 
// (e.g., "Dual BSD/GPL") in the license section of the ELF file
val license sec "license" = "Dual BSD/GPL"

// Alternative syntax ideas. Many variations exist
/*
val license sec("license")  = "Dual BSD/GPL" <- closest to C
val license @sec("license") = "Dual BSD/GPL"
val sec("license") license  = "Dual BSD/GPL"
*/
