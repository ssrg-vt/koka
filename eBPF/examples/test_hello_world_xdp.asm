eBPF/examples/test_hello_world_xdp.o:   file format elf64-bpf

Disassembly of section .text:

0000000000000000 <kk_string_replace_all>:
; static inline kk_string_t kk_string_replace_all(kk_string_t s, kk_string_t pat, kk_string_t rep, kk_context_t* ctx) {
       0:       63 1a fc ff 00 00 00 00 *(u32 *)(r10 - 4) = r1
       1:       63 2a f8 ff 00 00 00 00 *(u32 *)(r10 - 8) = r2
       2:       63 3a f4 ff 00 00 00 00 *(u32 *)(r10 - 12) = r3
       3:       7b 4a e8 ff 00 00 00 00 *(u64 *)(r10 - 24) = r4
;   return kk_unsafe_bytes_as_string(kk_bytes_replace_all(s, pat, rep, ctx));
       4:       79 a4 e8 ff 00 00 00 00 r4 = *(u64 *)(r10 - 24)
       5:       61 a3 f4 ff 00 00 00 00 r3 = *(u32 *)(r10 - 12)
       6:       61 a2 f8 ff 00 00 00 00 r2 = *(u32 *)(r10 - 8)
       7:       61 a1 fc ff 00 00 00 00 r1 = *(u32 *)(r10 - 4)
       8:       85 10 00 00 ff ff ff ff call -1
       9:       bf 01 00 00 00 00 00 00 r1 = r0
      10:       85 10 00 00 04 00 00 00 call 4
      11:       95 00 00 00 00 00 00 00 exit

0000000000000060 <kk_eBPF_bpflib_bpf__new_XDP__PASS>:
; static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_bpflib_bpf__new_XDP__PASS(kk_context_t* _ctx) {
      12:       7b 1a f8 ff 00 00 00 00 *(u64 *)(r10 - 8) = r1
      13:       b7 00 00 00 02 00 00 00 r0 = 2
;   return kk_eBPF_bpflib_bpf_XDP__PASS;
      14:       95 00 00 00 00 00 00 00 exit

0000000000000078 <kk_unsafe_bytes_as_string>:
; static inline kk_string_t kk_unsafe_bytes_as_string(kk_bytes_t b) {
      15:       63 1a fc ff 00 00 00 00 *(u32 *)(r10 - 4) = r1
;   return kk_unsafe_bytes_as_string_unchecked(b);
      16:       61 a1 fc ff 00 00 00 00 r1 = *(u32 *)(r10 - 4)
      17:       85 10 00 00 01 00 00 00 call 1
      18:       95 00 00 00 00 00 00 00 exit

0000000000000098 <kk_unsafe_bytes_as_string_unchecked>:
; static inline kk_string_t kk_unsafe_bytes_as_string_unchecked(kk_bytes_t b) {
      19:       63 1a fc ff 00 00 00 00 *(u32 *)(r10 - 4) = r1
;   kk_string_t s = { b };
      20:       61 a1 fc ff 00 00 00 00 r1 = *(u32 *)(r10 - 4)
      21:       63 1a f8 ff 00 00 00 00 *(u32 *)(r10 - 8) = r1
;   return s;
      22:       61 a0 f8 ff 00 00 00 00 r0 = *(u32 *)(r10 - 8)
      23:       95 00 00 00 00 00 00 00 exit

Disassembly of section xdp:

0000000000000000 <kk_eBPF_examples_hello__world__xdp_xdp__prog__simpl>:
;  __attribute__((section("xdp"), used)) static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_examples_hello__world__xdp_xdp__prog__simpl(kk_eBPF_bpflib_bpf__xdp__md ictx, kk_context_t* _ctx) { /* (ictx : eBPF/bpflib/bpf/xdp_md) -> eBPF/bpflib/bpf/xdp_action */ 
       0:       63 1a fc ff 00 00 00 00 *(u32 *)(r10 - 4) = r1
       1:       7b 2a f0 ff 00 00 00 00 *(u64 *)(r10 - 16) = r2
;   return kk_eBPF_bpflib_bpf__new_XDP__PASS(_ctx);
       2:       79 a1 f0 ff 00 00 00 00 r1 = *(u64 *)(r10 - 16)
       3:       85 10 00 00 0b 00 00 00 call 11
       4:       95 00 00 00 00 00 00 00 exit
