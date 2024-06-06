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

// initialization
void kk_eBPF_examples_pid__gid_pid__gid__example1__init(kk_context_t* _ctx){
  static bool _kk_initialized = false;
  if (_kk_initialized) return;
  _kk_initialized = true;
  kk_std_core_types__init(_ctx);
  kk_std_core_hnd__init(_ctx);
  kk_std_core_exn__init(_ctx);
  kk_std_core_bool__init(_ctx);
  kk_std_core_order__init(_ctx);
  kk_std_core_char__init(_ctx);
  kk_std_core_int__init(_ctx);
  kk_std_core_vector__init(_ctx);
  kk_std_core_array__init(_ctx);
  kk_std_core_string__init(_ctx);
  kk_std_core_sslice__init(_ctx);
  kk_std_core_list__init(_ctx);
  kk_std_core_maybe__init(_ctx);
  kk_std_core_either__init(_ctx);
  kk_std_core_tuple__init(_ctx);
  kk_std_core_show__init(_ctx);
  kk_std_core_debug__init(_ctx);
  kk_std_core_delayed__init(_ctx);
  kk_std_core__init(_ctx);
  kk_eBPF_bpflib_bpf__helpers__init(_ctx);
  kk_std_num_int64__init(_ctx);
  kk_std_core_console__init(_ctx);
  #if defined(KK_CUSTOM_INIT)
    KK_CUSTOM_INIT (_ctx);
  #endif
  {
    kk_eBPF_examples_pid__gid_pid__gid__example1_my__pid = (KK_I64(0)); /*int64*/
  }
}

// termination
void kk_eBPF_examples_pid__gid_pid__gid__example1__done(kk_context_t* _ctx){
  static bool _kk_done = false;
  if (_kk_done) return;
  _kk_done = true;
  #if defined(KK_CUSTOM_DONE)
    KK_CUSTOM_DONE (_ctx);
  #endif
  kk_skip_drop(kk_eBPF_examples_pid__gid_pid__gid__example1_my__pid, _ctx);
  kk_std_core_console__done(_ctx);
  kk_std_num_int64__done(_ctx);
  kk_eBPF_bpflib_bpf__helpers__done(_ctx);
  kk_std_core__done(_ctx);
  kk_std_core_delayed__done(_ctx);
  kk_std_core_debug__done(_ctx);
  kk_std_core_show__done(_ctx);
  kk_std_core_tuple__done(_ctx);
  kk_std_core_either__done(_ctx);
  kk_std_core_maybe__done(_ctx);
  kk_std_core_list__done(_ctx);
  kk_std_core_sslice__done(_ctx);
  kk_std_core_string__done(_ctx);
  kk_std_core_array__done(_ctx);
  kk_std_core_vector__done(_ctx);
  kk_std_core_int__done(_ctx);
  kk_std_core_char__done(_ctx);
  kk_std_core_order__done(_ctx);
  kk_std_core_bool__done(_ctx);
  kk_std_core_exn__done(_ctx);
  kk_std_core_hnd__done(_ctx);
  kk_std_core_types__done(_ctx);
}
