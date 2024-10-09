// https://github.com/lizrice/learning-ebpf/blob/main/chapter3/hello-func.bpf.c
/* #include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

static __attribute((noinline)) int get_opcode(struct bpf_raw_tracepoint_args *ctx) {
    return ctx->args[1];
}

SEC("raw_tp/")
int hello(struct bpf_raw_tracepoint_args *ctx) {
    int opcode = get_opcode(ctx);
    bpf_printk("Syscall: %d", opcode);
    return 0;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL"; */

import eBPF/bpflib/bpf_helpers
import eBPF/bpflib/bpf
import eBPF/bpflib/if_ethr
import eBPF/bpflib/ip
import std/num/int32
import std/num/int64
import std/core/console

//fattribute "noinline" fun get_opcode 