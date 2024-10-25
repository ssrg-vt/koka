/*
// On kernel 5.14:
// BPF program is too large. Processed 1000001 insn
// processed 1000001 insns (limit 1000000) max_states_per_insn 4 total_states 76924 peak_states 8 mark_read 1
// -- END PROG LOAD LOG --

#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/if_ether.h>
#include <arpa/inet.h>

#define ETH_P_IPV4      0x0800

SEC("xdp")
int xdp_drop_prog(struct xdp_md *ctx)
{
    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;
    struct ethhdr *eth = data;
    __u16 h_proto;
    if (data + sizeof(struct ethhdr) > data_end)
        return XDP_DROP;
    h_proto = eth->h_proto;
    for (int i = 0; i < h_proto; i++) {
       bpf_printk("%d", h_proto);
    }
    if (h_proto == htons(ETH_P_IPV4))
        return XDP_PASS;
    return XDP_DROP;
}
char _license[] SEC("license") = "GPL";
*/

import std/num/int32
import bpf/bpflib/bpf
import bpf/bpflib/if_ether

pub extern htons (x : int32) : int32
  c inline "htons(#1)"

pub extern sizeof (n : a) : int32
  c inline "sizeof(#1)"

// must begin with a lower case or Koka thinks it's a constructor
val eth_p_ipv4 = 0x0800.int32

// ctx and context are reserved word in Koka
pub fun xdp_drop_prog(packet_context : xdp_md) {

  // Aya converts their uint32 to a uname (pointer sized integer)
  val data_end : int32 = packet_context.data_end 
  val data : int32 = packet_context.data;

  // sizeof(struct ethhdr) should be 14. would be nice to pass a type to sizeof
  // instead of dummy value
  val ethhdr_dummy : ethhdr = Ethhdr()
  if data + sizeof(ethhdr_dummy) > data_end
    then return XDP_DROP

  // no good way to do the casting so directly pull the low 16 bits
  var h_proto : int32 := data.lo()

  while { h_proto > 0.int32 }
    h_proto := h_proto - 1.int32
    // should call bpf_printk but that hasn't been added yet

  // should use bpf_htons but that is not yet supported and the origional 
  // program opts for ordinary htons
  if h_proto == htons(eth_p_ipv4)
    then return XDP_PASS

  return XDP_DROP
}

pub fun main() : int {
  val count : int = 10
  2 ^ count
}
