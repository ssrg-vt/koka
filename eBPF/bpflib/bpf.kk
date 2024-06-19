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

pub ref struct bpf_pidns_info 
  pid : int32
  tgid : int32

/* user accessible mirror of in-kernel sk_buff.
 * new fields can only be added to the end of this structure
 */
pub ref struct sk_buff //__sk_buff
  len : int32
  pkt_type : int32
  mark : int32
  queue_mapping : int32
  protocol : int32
  vlan_present : int32 
  vlan_tci : int32
  vlan_proto : int32
  priority : int32
  ingress_ifindex : int32 
  ifindex : int32
  tc_index : int32
  //cb : array of int of size 5 (* add later: __u32 cb[5] *)
  hash : int32
  tc_classid : int32
  data : int32
  data_end : int32
  napi_id : int32
  /* Accessed by BPF_PROG_TYPE_sk_skb types from here to ... */
  family : int32
  /* stored in network byte order */
  remote_ip4 : int32
  local_ip4 : int32
  //remote_ip6 : array of size 4 of type int (* add later: __u32 remote_ip6[4] *)
  //local_ip6 : array of size 4 of type int (* add later: __u32 local_ip6[4] *)
  /* stored in host byte order */
  local_port : int32
  data_meta : int32
  //__bpf_md_ptr(struct bpf_flow_keys *, flow_keys); (* add later *)
  tstamp : int64 
  wire_len : int32
  gso_segs : int32
  //__bpf_md_ptr(struct bpf_sock *, sk);(* add later *)
  gso_size : int32 
  tstamp_type : int32 // use int8 instead 
  // 	__u32 :24;		/* Padding, future use. */ (* add later *)
  hwtstamp : int64





