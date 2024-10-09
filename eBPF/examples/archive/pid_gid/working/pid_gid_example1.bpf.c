// Koka generated module: eBPF/examples/pid_gid/pid_gid_example1, koka version: 3.1.0, platform: 64-bit
#include "eBPF_examples_pid__gid_pid__gid__example1.h"
 
// https://github.com/libbpf/libbpf-bootstrap/blob/master/examples/c/minimal.bpf.c

int64_t kk_eBPF_examples_pid__gid_pid__gid__example1_my__pid;

 __attribute__((section("tp/syscalls/sys_enter_write"), used)) kk_integer_t kk_eBPF_examples_pid__gid_pid__gid__example1_handle__tp(kk_context_t* _ctx) { /* () -> int */ 
  int64_t i_10000 = kk_eBPF_bpflib_bpf__helpers_bpf__get__current__pid__tgid(_ctx); /*int64*/;
  int64_t pid;
  int64_t _x_x2 = (KK_I64(32)); /*int64*/
  pid = (int64_t)kk_shr64(i_10000,_x_x2); /*int64*/
  bool _match_x1 = (pid != kk_eBPF_examples_pid__gid_pid__gid__example1_my__pid); /*bool*/;
  if (_match_x1) {
    return kk_integer_from_small(0);
  }
  {
    return kk_integer_from_int64(pid,kk_context());
  }
}

kk_integer_t kk_eBPF_examples_pid__gid_pid__gid__example1_main(kk_context_t* _ctx) { /* () -> int */ 
  int64_t i_10002 = kk_eBPF_bpflib_bpf__helpers_bpf__get__current__pid__tgid(_ctx); /*int64*/;
  int64_t pid;
  int64_t _x_x3 = (KK_I64(32)); /*int64*/
  pid = (int64_t)kk_shr64(i_10002,_x_x3); /*int64*/
  bool _match_x0 = (pid != kk_eBPF_examples_pid__gid_pid__gid__example1_my__pid); /*bool*/;
  if (_match_x0) {
    return kk_integer_from_small(0);
  }
  {
    return kk_integer_from_int64(pid,kk_context());
  }
}