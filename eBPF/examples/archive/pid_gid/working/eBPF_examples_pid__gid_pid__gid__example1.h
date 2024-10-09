/*#pragma once
#ifndef kk_eBPF_examples_pid__gid_pid__gid__example1_H
#define kk_eBPF_examples_pid__gid_pid__gid__example1_H*/
// Koka generated module: eBPF/examples/pid_gid/pid_gid_example1, koka version: 3.1.0, platform: 64-bit
#include <linux/types.h>
#include <asm/types.h>
#include <stdint.h>
#include </home/swarnp/research/koka/eBPF/ebpf_kklib.h>
//#include </home/swarnp/research/koka/eBPF/examples/pid_gid/working/ebpf_kklib.h>

/*#include <kklib.h>*/
#include <bpf/bpf_helpers.h>
/*#include <linux/bpf.h>
#include <inttypes.h>
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
#include "std_core.h"*/
#include "eBPF_bpflib_bpf__helpers.h"
/*#include "std_num_int64.h"
#include "std_core_console.h"*/

// type declarations

// value declarations

extern int64_t kk_eBPF_examples_pid__gid_pid__gid__example1_my__pid;

 __attribute__((section("tp/syscalls/sys_enter_write"), used)) kk_integer_t kk_eBPF_examples_pid__gid_pid__gid__example1_handle__tp(kk_context_t* _ctx); /* () -> int */ 

kk_integer_t kk_eBPF_examples_pid__gid_pid__gid__example1_main(kk_context_t* _ctx); /* () -> int */ 

void kk_eBPF_examples_pid__gid_pid__gid__example1__init(kk_context_t* _ctx);


void kk_eBPF_examples_pid__gid_pid__gid__example1__done(kk_context_t* _ctx);

//#endif // header
