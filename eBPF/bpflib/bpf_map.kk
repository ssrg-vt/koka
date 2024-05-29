module eBPF/bpflib/bpf_map

import std/core/int

// https://elixir.bootlin.com/linux/latest/source/kernel/bpf/helpers.c

effect gpl_only {}

effect pkt_access {}

pub type bpf_map_type 
  BPF_MAP_TYPE_UNSPEC
  BPF_MAP_TYPE_HASH
  BPF_MAP_TYPE_ARRAY
  BPF_MAP_TYPE_PROG_ARRAY
  BPF_MAP_TYPE_PERF_EVENT_ARRAY
  BPF_MAP_TYPE_PERCPU_HASH
  BPF_MAP_TYPE_PERCPU_ARRAY
  BPF_MAP_TYPE_STACK_TRACE
  BPF_MAP_TYPE_CGROUP_ARRAY
  BPF_MAP_TYPE_LRU_HASH
  BPF_MAP_TYPE_LRU_PERCPU_HASH
  BPF_MAP_TYPE_LPM_TRIE
  BPF_MAP_TYPE_ARRAY_OF_MAPS
  BPF_MAP_TYPE_HASH_OF_MAPS
  BPF_MAP_TYPE_DEVMAP
  BPF_MAP_TYPE_SOCKMAP
  BPF_MAP_TYPE_CPUMAP
  BPF_MAP_TYPE_XSKMAP
  BPF_MAP_TYPE_SOCKHASH
  BPF_MAP_TYPE_CGROUP_STORAGE_DEPRECATED
  /* BPF_MAP_TYPE_CGROUP_STORAGE is available to bpf programs attaching
	 * to a cgroup. The newer BPF_MAP_TYPE_CGRP_STORAGE is available to
	 * both cgroup-attached and other progs and supports all functionality
	 * provided by BPF_MAP_TYPE_CGROUP_STORAGE. So mark
	 * BPF_MAP_TYPE_CGROUP_STORAGE deprecated.
  */
  BPF_MAP_TYPE_CGROUP_STORAGE 
  BPF_MAP_TYPE_REUSEPORT_SOCKARRAY
  BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE_DEPRECATED
  /* BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE is available to bpf programs
	 * attaching to a cgroup. The new mechanism (BPF_MAP_TYPE_CGRP_STORAGE +
	 * local percpu kptr) supports all BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE
	 * functionality and more. So mark * BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE
	 * deprecated.
  */
  BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE 
  BPF_MAP_TYPE_QUEUE
  BPF_MAP_TYPE_STACK
  BPF_MAP_TYPE_SK_STORAGE
  BPF_MAP_TYPE_DEVMAP_HASH
  BPF_MAP_TYPE_STRUCT_OPS
  BPF_MAP_TYPE_RINGBUF
  BPF_MAP_TYPE_INODE_STORAGE
  BPF_MAP_TYPE_TASK_STORAGE
  BPF_MAP_TYPE_BLOOM_FILTER
  BPF_MAP_TYPE_USER_RINGBUF
  BPF_MAP_TYPE_CGRP_STORAGE

pub type flag_map
  BPF_ANY       /* create new element or update existing */
  BPF_NOEXIST   /* create new element if it didn't exist */
  BPF_EXIST     /* update existing element */


pub ref struct sec ".maps" eBPF_map<a,b> 
  map_type : bpf_map_type 
  max_entries : int
  key_type : a
  value_type : b
  map_flags : flag_map
 
/* void *bpf_map_lookup_elem(struct bpf_map *map, const void *key) -> not mutable key (const) & pointer to user passed type (void *)
   Description : Perform a lookup in map for an entry associated to key. */
pub extern bpf_map_lookup_elem (m : eBPF_map<a,b>, k : ref<h,a>) : ref<h,b>
  c inline "bpf_map_lookup_elem(#1, #2)"

/* long bpf_map_update_elem(struct bpf_map *map, const void *key, const void *value, u64 flags)
   Description : Add or update the value of the entry associated to key in map with value. flags is one of:
      BPF_NOEXIST : The entry for key must not exist in the map.
      BPF_EXIST : The entry for key must already exist in the map.
      BPF_ANY : No condition on the existence of the entry for key.
      Flag value BPF_NOEXIST cannot be used for maps of types BPF_MAP_TYPE_ARRAY or BPF_MAP_TYPE_PERCPU_ARRAY  
      (all elements always exist), the helper would return an error.
   Return 0 on success, or a negative error in case of failure. */
pub extern bpf_map_update_elem (m : eBPF_map<a,b>, k : ref<h,a>, v : ref<h,b>, f : flag_map) : int 
  c inline "bpf_map_update_elem"

/* long bpf_map_delete_elem(struct bpf_map *map, const void *key)
   Description : Delete entry with key from map.
   Return 0 on success, or a negative error in case of failure. */
pub extern bpf_map_delete_elem (m : eBPF_map<a,b>, k : ref<h,a>) : int 
  c inline "bpf_map_delete_elem"









