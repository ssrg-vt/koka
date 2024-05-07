// //#pragma once
// //#ifndef kk_eBPF_examples_hello__world__xdp_H
// //#define kk_eBPF_examples_hello__world__xdp_H
// // Koka generated module: eBPF/examples/hello_world_xdp, koka version: 3.1.0, platform: 64-bit
// /*#include <kklib.h>
// #include "std_core_types.h"
// #include "std_core_hnd.h"
// #include "std_core_exn.h"
// #include "std_core_bool.h"
// #include "std_core_order.h"
// #include "std_core_char.h"
// #include "std_core_int.h"
// #include "std_core_vector.h"
// #include "std_core_sslice.h"
// #include "std_core_list.h"
// #include "std_core_maybe.h"
// #include "std_core_either.h"
// #include "std_core_tuple.h"
// #include "std_core_show.h"
// #include "std_core_debug.h"
// #include "std_core_delayed.h"
// #include "std_core.h"
// #include "std_num_int32.h"
// //#include "std_core_string.h"
// #include "std_core_console.h"*/
// // #include "eBPF_bpflib_bpf.h"

// // type declarations
// #include <linux/bpf.h>
// #include <bpf/bpf_helpers.h>

// enum kk_eBPF_bpflib_bpf__xdp__action_e {
//   kk_eBPF_bpflib_bpf_XDP__ABORTED,
//   kk_eBPF_bpflib_bpf_XDP__DROP,
//   kk_eBPF_bpflib_bpf_XDP__PASS,
//   kk_eBPF_bpflib_bpf_XDP__TX,
//   kk_eBPF_bpflib_bpf_XDP__REDIRECT
// };
// typedef int kk_eBPF_bpflib_bpf__xdp__action;

// // __attribute__((section("xdp"), used)) /*static inline*/ int kk_eBPF_bpflib_bpf__new_XDP__PASS() {
// //   return (int) kk_eBPF_bpflib_bpf_XDP__PASS;
// // }

// value declarations

//#include <linux/bpf.h>

enum kk_eBPF_bpflib_bpf__xdp__action_e {
  kk_eBPF_bpflib_bpf_XDP__ABORTED,
  kk_eBPF_bpflib_bpf_XDP__DROP,
  kk_eBPF_bpflib_bpf_XDP__PASS,
  kk_eBPF_bpflib_bpf_XDP__TX,
  kk_eBPF_bpflib_bpf_XDP__REDIRECT
 };

  __attribute__((section("xdp"), used)) /*static inline*/ int kk_eBPF_examples_hello__world__xdp_xdp__prog__simpl(void *ictx) {
   return kk_eBPF_bpflib_bpf_XDP__PASS;
 }

/*#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

int counter = 0;

SEC("xdp")
int test_hello_world_xdp(void *ctx) {
    bpf_printk("%d", counter);
    counter++;
    return XDP_PASS;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";*/