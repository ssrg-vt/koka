module eBPF/bpflib/bpf

import std/core/types
import std/core/int
import std/num/int32

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


/* user accessible metadata for XDP packet hook
 */
pub struct xdp_md {
    data : int
    data_end : int
    /*ingree_ifindex : int
    rx_queue_index : int 
    egress_ifindex: int */
} 
