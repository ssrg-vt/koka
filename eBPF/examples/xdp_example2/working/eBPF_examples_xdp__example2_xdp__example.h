#pragma once
#ifndef kk_eBPF_examples_xdp__example2_xdp__example_H
#define kk_eBPF_examples_xdp__example2_xdp__example_H
// Koka generated module: eBPF/examples/xdp_example2/xdp_example, koka version: 3.1.0, platform: 64-bit
#include <linux/types.h>
#include <asm/types.h>
//#include <kklib.h>
#include <bpf/bpf_helpers.h>
#include <linux/bpf.h>
#include <inttypes.h>
#include <stdint.h>
/*#include "std_core_types.h"
#include "std_core_hnd.h"
#include "std_core_exn.h"
#include "std_core_bool.h"
#include "std_core_order.h"
#include "std_core_char.h"
#include "std_core_int.h"
#include "std_core_vector.h"
#include "std_core_array.h"
#include "std_core_sslice.h"
#include "std_core_list.h"
#include "std_core_maybe.h"
#include "std_core_either.h"
#include "std_core_tuple.h"
#include "std_core_show.h"
#include "std_core_debug.h"
#include "std_core_delayed.h"
#include "std_core.h"
#include "std_num_int32.h"
#include "std_core_console.h"
#include "std_core_string.h"*/
#include "eBPF_bpflib_bpf.h"

// type declarations

// value declarations

 __attribute__((section("xdp"), used)) kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_examples_xdp__example2_xdp__example_xdp__example(kk_eBPF_bpflib_bpf__xdp__md xdpctx, kk_context_t* _ctx); /* (xdpctx : eBPF/bpflib/bpf/xdp_md) -> eBPF/bpflib/bpf/xdp_action */ 

kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_examples_xdp__example2_xdp__example_main(kk_context_t* _ctx); /* () -> eBPF/bpflib/bpf/xdp_action */ 

void kk_eBPF_examples_xdp__example2_xdp__example__init(kk_context_t* _ctx);


void kk_eBPF_examples_xdp__example2_xdp__example__done(kk_context_t* _ctx);

#endif // header

