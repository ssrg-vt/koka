/*
Focus points:
  - helper return value: pointer to buffer
  - bpf map
*/

/*
#include <linux/bpf.h>
#include <linux/types.h>
#include <bpf/bpf_helpers.h>

struct {
    __uint(type, BPF_MAP_TYPE_ARRAY);
    __type(key, __u32);
    __type(value, __u32);
    __uint(max_entries, 256);
} array_map SEC(".maps");

// Counter program that traces the number of times this hookpoint has been hit
SEC("tp/syscalls/sys_enter_getcwd")
int array(void *ctx)
{
    __u32 key = 0;
    __u32 *val = bpf_map_lookup_elem(&array_map, &key);
    if (!val) {
        return -1;
    } else {
        __u32 new = (*val) + 1;
        bpf_map_update_elem(&array_map, &key, &new, BPF_ANY);
    }
    return 0;
}

char LISENSE[] SEC("license") = "Dual BSD/GPL";
*/

import bpf/bpflib/bpf
import bpf/bpflib/bpf_helpers
import bpf/bpflib/bpf_map

// flags require bitmask
val array_map = Bpf_map(BPF_MAP_TYPE_HASH, 64, 0, 0)

pub sec "tp/syscalls/sys_enter_getcwd" fun array(ctx : void) {
  val key = 0
  val value : maybe<ref<h,int32>> = bpf_map_lookup_elem(array_map, key)

  if value == Nothing
    then return -1

  val new = value.unjust + 1
  bpf_map_update_elem(array_map, key, new, BPF_ANY)
  return 0
}

val license sec "license" = "Dual BSD/GPL"
