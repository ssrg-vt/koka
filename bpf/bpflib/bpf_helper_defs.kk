module bpf/bpflib/bpf_helper_defs

import bpf/bpflib/bpf_map
import std/num/int64
import std/num/int32

extern import
  c file "../src/bpfprintk.c"

/*
 * bpf_get_current_uid_gid
 *
 * 	Get the current uid and gid.
 *
 * Returns
 * 	A 64-bit integer containing the current GID and UID, and
 * 	created as such: current_gid << 32 | current_uid.
 *
 * static __u64 (* const bpf_get_current_uid_gid)(void) = (void *) 15;
 */
pub extern bpf_get_current_uid_gid () : int64
  c inline "bpf_get_current_uid_gid()"

/*
 * bpf_get_current_pid_tgid
 *
 * 	Get the current pid and tgid.
 *
 * Returns
 * 	A 64-bit integer containing the current tgid and pid, and
 * 	created as such:
 * 	current_task->tgid << 32 | current_task->pid.
 *
 * static __u64 (* const bpf_get_current_pid_tgid)(void) = (void *) 14;
 */
pub extern bpf_get_current_pid_tgid () : int64
  c inline "bpf_get_current_pid_tgid()"

/*
 * bpf_get_ns_current_pid_tgid
 *
 * 	Returns 0 on success, values for *pid* and *tgid* as seen from the current
 * 	*namespace* will be returned in *nsdata*.
 *
 * Returns
 * 	0 on success, or one of the following in case of failure:
 *
 * 	**-EINVAL** if dev and inum supplied don't match dev_t and inode number
 * 	with nsfs of current task, or if dev conversion to dev_t lost high bits.
 *
 * 	**-ENOENT** if pidns does not exists for the current task.
 *
 * static long (* const bpf_get_ns_current_pid_tgid)(__u64 dev, __u64 ino, struct bpf_pidns_info *nsdata, __u32 size) = (void *) 120;
 */
pub extern bpf_get_ns_current_pid_tgid (dev : int64, ino : int64, nsdata : ref<h,bpf_pidns_info>, size : int32) : int64 
  c inline "bpf_get_ns_current_pid_tgid(#1, #2, #3, #4)"

/*
 * bpf_map_lookup_elem
 *
 * 	Perform a lookup in *map* for an entry associated to *key*.
 *
 * Returns
 * 	Map value associated to *key*, or **NULL** if no entry was
 * 	found.
 *
 * static void *(* const bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
 */
pub extern bpf_map_lookup_elem (m : bpf_map<a,b>, k : ref<h,a>) : ref<h,b>
  c inline "bpf_map_lookup_elem(#1, #2)"

/*
 * bpf_map_update_elem
 *
 * 	Add or update the value of the entry associated to *key* in
 * 	*map* with *value*. *flags* is one of:
 *
 * 	**BPF_NOEXIST**
 * 		The entry for *key* must not exist in the map.
 * 	**BPF_EXIST**
 * 		The entry for *key* must already exist in the map.
 * 	**BPF_ANY**
 * 		No condition on the existence of the entry for *key*.
 *
 * 	Flag value **BPF_NOEXIST** cannot be used for maps of types
 * 	**BPF_MAP_TYPE_ARRAY** or **BPF_MAP_TYPE_PERCPU_ARRAY**  (all
 * 	elements always exist), the helper would return an error.
 *
 * Returns
 * 	0 on success, or a negative error in case of failure.
 *
 * static long (* const bpf_map_update_elem)(void *map, const void *key, const void *value, __u64 flags) = (void *) 2;
 */
pub extern bpf_map_update_elem (m : bpf_map<a,b>, k : ref<h,a>, v : ref<h,b>, f : flag_map) : int 
  c inline "bpf_map_update_elem"

/*
 * bpf_map_delete_elem
 *
 * 	Delete entry with *key* from *map*.
 *
 * Returns
 * 	0 on success, or a negative error in case of failure.
 *
 * static long (* const bpf_map_delete_elem)(void *map, const void *key) = (void *) 3;
 */
pub extern bpf_map_delete_elem (m : bpf_map<a,b>, k : ref<h,a>) : int 
  c inline "bpf_map_delete_elem"


// NOT BPF HELPER FUNCTIONS BUT WILL BE USEFUL TO HAVE

pub extern int32/bpf_printk(a : int32) : io ()
  c inline "kk_printf_int32(#1)"

pub extern int64/bpf_printk(a : int64) : io () 
  c inline "kk_printf_int64(#1)" 

// Convert from big-endian to little-endian
pub extern bpf_htons (x : int32) : int32
  c inline "__builtin_bswap32(#1)"

// 
pub extern sizeof (n : a) : int32
  c inline "sizeof(#1)"

pub fun main()
  val s = "hello"
  println(s)