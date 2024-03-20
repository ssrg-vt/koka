module hello_world_xdp

import std/num/int32
import std/core/string
import std/core/console
import eBPF/bpflib/bpf

/* pub sec "xdp" fun hello_world_xdp(ictx : ref<h,xdp_md>) : <read<h>> int32 {
   val xc = !ictx
   val d = xc.data
   return d
   //return XDP_PASS
} */

pub sec "xdp" fun xdp_prog_simpl(ictx : ref<h, xdp_md>) : xdp_action {
   return XDP_PASS
}

pub fun main() {
   val ictx1 = Xdp_md(10.int32, 20.int32)
   //val r = hello_world_xdp(ref(ictx1))
   val r = xdp_prog_simpl(ref(ictx1))
   println("Successful with: " ++ r.xdp_action_show)
}


