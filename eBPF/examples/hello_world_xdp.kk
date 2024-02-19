module hello_world_xdp

import eBPF/bpflib/bpf

//SEC("xdp")

pub fun main()
   val xdp_md_ctx = Xdp_md( 10, 20 )
   println("Hello World")

fun hello_world_xdp(xdp_md_ctx : xdp_md) 
    val 
    println("Hello World!")


