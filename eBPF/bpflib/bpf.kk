module eBPF/bpflib/bpf

import std/core/types
import std/core/int
import std/num/int32

/* https://elixir.bootlin.com/linux/v4.9/source/include/uapi/linux/bpf.h */

/* User return code for XDP prog type:
   A valid XDP program must return one of these valid field. 
   All other return codes are reserved for future use. 
   Unknown return codes will result in packet drops and a warning vid bpf_warn_invalid_xdp_action()
 */
pub type xdp_action 
  XDP_ABORTED 
  XDP_DROP
  XDP_PASS
  XDP_TX
  XDP_REDIRECT

pub fun xdp_action_show( xdp : xdp_action ) : string
  match xdp
    XDP_ABORTED -> "XDP_ABORTED"
    XDP_DROP -> "XDP_DROP"
    XDP_PASS -> "XDP_PASS"
    XDP_TX -> "XDP_TX"
    XDP_REDIRECT -> "XDP_REDIRECT"

pub struct xdp_md 
  data : int32       // pointer to beginning of the packet data
  data_end : int32  // pointer to the end of the packet data

pub type bpf_prog_type 
  BPF_PROG_TYPE_UNSPEC
  BPF_PROG_TYPE_SOCKET_FILTER // filter, redirect socket data and monitor socket events
  BPF_PROG_TYPE_SCHED_CLS
  BPF_PROG_TYPE_SCHED_ACT
  BPF_PROG_TYPE_TRACEPOINT
  BPF_PROG_TYPE_XDP // allows access to packet data as early as possible, before packet metadata has been assigned
  BPF_PROG_TYPE_PERF_EVENT


/* Register Names */
pub type bpf_registers 
  BPF_REG_0
  BPF_REG_1
  BPF_REG_2
  BPF_REG_3
  BPF_REG_4
  BPF_REG_5
  BPF_REG_6
  BPF_REG_7
  BPF_REG_8
  BPF_REG_9
  BPF_REG_10




