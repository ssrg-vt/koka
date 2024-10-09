/* C- example 
SEC("xdp")
int xdp_hello(struct xdp_md *ctx) {
  void *data = (void *)(long)ctx->data;
  void *data_end = (void *)(long)ctx->data_end;

  // Attempt to read outside the packet
  // data_end++; 

   // This is a loop that will pass the verifier
   // for (int i=0; i < 10; i++) {
   //    bpf_printk("Looping %d", i);
   // }

   // This is a loop that will fail the verifier
   // for (int i=0; i < c; i++) {
   //    bpf_printk("Looping %d", i);
   // }

  // Comment out the next two lines and there won't be a return code defined
  bpf_printk("%x %x", data, data_end);
  return XDP_PASS;
}

// Removing the license section means the verifier won't let you use
// GPL-licensed helpers
char LICENSE[] SEC("license") = "Dual BSD/GPL"; */
module xdp_example

import std/num/int32
import std/core/console
import std/core/string
import eBPF/bpflib/bpf

pub sec "xdp" fun xdp_example(xdpctx : xdp_md) {
  val p = !xdpctx.ref
  val data = p.data
  val data_end = p.data_end
  //println("Hello from xdp!")
  return XDP_PASS
}

pub fun main() {
  val xdpctx = Xdp_md(10.int32, 20.int32, 30.int32, 40.int32, 50.int32, 60.int32)
  xdp_example(xdpctx)
}

