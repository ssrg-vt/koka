module eBPF/bpflib/bpf

import std/core/types
import std/core/int
import std/num/int32

/* https://elixir.bootlin.com/linux/v6.9-rc7/source/include/uapi/linux/bpf.h */

/* User return code for XDP prog type:
   A valid XDP program must return one of these valid field. 
   All other return codes are reserved for future use. 
   Unknown return codes will result in packet drops and a warning vid bpf_warn_invalid_xdp_action()
 */
pub type xdp_action {
  XDP_ABORTED 
  XDP_DROP
  XDP_PASS
  XDP_TX
  XDP_REDIRECT
}

pub fun xdp_action_show( xdp : xdp_action ) : string
  match xdp
    XDP_ABORTED -> "XDP_ABORTED"
    XDP_DROP -> "XDP_DROP"
    XDP_PASS -> "XDP_PASS"
    XDP_TX -> "XDP_TX"
    XDP_REDIRECT -> "XDP_REDIRECT"

pub ref struct xdp_md 
  data : int32       // pointer to beginning of the packet data // should be changed to unsigned int
  data_end : int32  // pointer to the end of the packet data // should be changed to unsigned int
  data_meta : int32 // meta data
  // Below access go through struct xdp_rxq_info // should be changed to unsigned int
  ingress_ifindex : int32 // rxq->dev->ifindex 
  rx_queue_index : int32  // rxq->queue_index  
  egress_ifindex : int32 // txq->dev->ifindex 





