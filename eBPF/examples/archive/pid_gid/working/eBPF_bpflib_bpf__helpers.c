// Koka generated module: eBPF/bpflib/bpf_helpers, koka version: 3.1.0, platform: 64-bit
#include "eBPF_bpflib_bpf__helpers.h"
 
/* u64 bpf_get_current_pid_tgid(void)
   Description : Get the current pid and tgid.
   Return A 64-bit integer containing the current tgid and pid,
     and created as such: current_task->tgid << 32 | current_task->pid. */

int64_t kk_eBPF_bpflib_bpf__helpers_bpf__get__current__pid__tgid(kk_context_t* _ctx) { /* () -> int64 */ 
  return bpf_get_current_pid_tgid();
}
 
/* u64 bpf_get_current_uid_gid(void)
   Description : Get the current uid and gid.
   Return A 64-bit integer containing the current GID and UID,
    and created as such: current_gid << 32 | current_uid. */

int64_t kk_eBPF_bpflib_bpf__helpers_bpf__get__current__uid__gid(kk_context_t* _ctx) { /* () -> int64 */ 
  return bpf_get_current_uid_gid();
}

// initialization
void kk_eBPF_bpflib_bpf__helpers__init(kk_context_t* _ctx){
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
  kk_std_core_console__init(_ctx);
  kk_std_core__init(_ctx);
  kk_std_num_int64__init(_ctx);
  #if defined(KK_CUSTOM_INIT)
    KK_CUSTOM_INIT (_ctx);
  #endif
}

// termination
void kk_eBPF_bpflib_bpf__helpers__done(kk_context_t* _ctx){
  static bool _kk_done = false;
  if (_kk_done) return;
  _kk_done = true;
  #if defined(KK_CUSTOM_DONE)
    KK_CUSTOM_DONE (_ctx);
  #endif
  kk_std_num_int64__done(_ctx);
  kk_std_core__done(_ctx);
  kk_std_core_console__done(_ctx);
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
