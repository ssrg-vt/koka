// Koka generated module: eBPF/examples/xdp_example2/xdp_example, koka version: 3.1.0, platform: 64-bit
#include "eBPF_examples_xdp__example2_xdp__example.h"

 __attribute__((section("xdp"), used)) kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_examples_xdp__example2_xdp__example_xdp__example(kk_eBPF_bpflib_bpf__xdp__md xdpctx, kk_context_t* _ctx) { /* (xdpctx : eBPF/bpflib/bpf/xdp_md) -> eBPF/bpflib/bpf/xdp_action */ 
  kk_ref_t _b_x1_2 = kk_ref_alloc((kk_eBPF_bpflib_bpf__xdp__md_box(xdpctx, _ctx)),kk_context()); /*ref<_26,eBPF/bpflib/bpf/xdp_md>*/;
  kk_eBPF_bpflib_bpf__xdp__md p;
  kk_box_t _x_x8 = kk_ref_get(_b_x1_2,kk_context()); /*1001*/
  p = kk_eBPF_bpflib_bpf__xdp__md_unbox(_x_x8, KK_OWNED, _ctx); /*eBPF/bpflib/bpf/xdp_md*/
  kk_datatype_ptr_dropn(p, (KK_I32(0)), _ctx);
  return kk_eBPF_bpflib_bpf__new_XDP__PASS(_ctx);
}
