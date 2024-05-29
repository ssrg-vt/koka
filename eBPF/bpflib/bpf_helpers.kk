module eBPF/bpflib/bpf_helpers

import std/num/int64

/* u64 bpf_get_current_uid_gid(void)
   Description : Get the current uid and gid.
   Return A 64-bit integer containing the current GID and UID, 
    and created as such: current_gid << 32 | current_uid. */
pub extern bpf_get_current_uid_gid () : int64
  c inline "bpf_get_current_uid_gid()"

/* u64 bpf_get_current_pid_tgid(void)
   Description : Get the current pid and tgid.
   Return A 64-bit integer containing the current tgid and pid, 
     and created as such: current_task->tgid << 32 | current_task->pid. */
pub extern bpf_get_current_pid_tgid () : int64
  c inline "bpf_get_current_pid_tgid()"