/*#pragma once
#ifndef kk_eBPF_examples_hello__world__xdp_H
#define kk_eBPF_examples_hello__world__xdp_H
// Koka generated module: eBPF/examples/hello_world_xdp, koka version: 3.1.0, platform: 64-bit
#include <kklib.h>
#include "std_core_types.h"
#include "std_core_hnd.h"
#include "std_core_exn.h"
#include "std_core_bool.h"
#include "std_core_order.h"
#include "std_core_char.h"
#include "std_core_int.h"
#include "std_core_vector.h"
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
#include "std_core_string.h"
#include "std_core_console.h"*/
#include "eBPF_bpflib_bpf.h"

// type declarations

// value declarations

// __attribute__((section("xdp"), used)) static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_examples_hello__world__xdp_xdp__prog__simpl(kk_eBPF_bpflib_bpf__xdp__md ictx, kk_context_t* _ctx) { /* (ictx : eBPF/bpflib/bpf/xdp_md) -> eBPF/bpflib/bpf/xdp_action */ 
//  kk_datatype_ptr_dropn(ictx, (KK_I32(0)), _ctx);
//  return kk_eBPF_bpflib_bpf__new_XDP__PASS(_ctx);
//}

// Accepted by Clang targeting BPF 
// Need to change the type
// Need to remove static inline: 
// libbpf: sec 'xdp': program 'kk_eBPF_examples_hello__world__xdp_xdp__prog__simpl' is static and not supported
__attribute__((section("xdp"), used)) kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_examples_hello__world__xdp_xdp__prog__simpl(struct kk_eBPF_bpflib_bpf_Xdp__md* ictx, kk_context_t* _ctx) { /* (ictx : eBPF/bpflib/bpf/xdp_md) -> eBPF/bpflib/bpf/xdp_action */ 
//  kk_datatype_ptr_dropn(ictx, (KK_I32(0)), _ctx);
  return kk_eBPF_bpflib_bpf__new_XDP__PASS(_ctx);
}

void kk_eBPF_examples_hello__world__xdp__init(kk_context_t* _ctx);


void kk_eBPF_examples_hello__world__xdp__done(kk_context_t* _ctx);

//#endif // header
