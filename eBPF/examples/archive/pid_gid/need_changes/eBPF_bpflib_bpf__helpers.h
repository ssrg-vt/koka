#pragma once
#ifndef kk_eBPF_bpflib_bpf__helpers_H
#define kk_eBPF_bpflib_bpf__helpers_H
// Koka generated module: eBPF/bpflib/bpf_helpers, koka version: 3.1.0, platform: 64-bit
#include <linux/types.h>
#include <asm/types.h>
#include <kklib.h>
#include <bpf/bpf_helpers.h>
#include <linux/bpf.h>
#include <inttypes.h>
#include <stdint.h>
#include "std_core_types.h"
#include "std_core_hnd.h"
#include "std_core_exn.h"
#include "std_core_bool.h"
#include "std_core_order.h"
#include "std_core_char.h"
#include "std_core_int.h"
#include "std_core_vector.h"
#include "std_core_array.h"
#include "std_core_string.h"
#include "std_core_sslice.h"
#include "std_core_list.h"
#include "std_core_maybe.h"
#include "std_core_either.h"
#include "std_core_tuple.h"
#include "std_core_show.h"
#include "std_core_debug.h"
#include "std_core_delayed.h"
#include "std_core_console.h"
#include "std_core.h"
#include "std_num_int64.h"

// type declarations

// value declarations

int64_t kk_eBPF_bpflib_bpf__helpers_bpf__get__current__pid__tgid(kk_context_t* _ctx); /* () -> int64 */ 

int64_t kk_eBPF_bpflib_bpf__helpers_bpf__get__current__uid__gid(kk_context_t* _ctx); /* () -> int64 */ 

void kk_eBPF_bpflib_bpf__helpers__init(kk_context_t* _ctx);


void kk_eBPF_bpflib_bpf__helpers__done(kk_context_t* _ctx);

#endif // header
