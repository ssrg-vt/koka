
import eBPF/bpflib/ebpf_map
import eBPF/bpflib/bpf_helpers_check
import std/core/string
import std/core/types
import std/core/int

pub fun get_max_entries (m : eBPF_map<int,string>) : int 
  return m.max_entries
pub fun main() {
  val a = EBPF_map(BPF_MAP_TYPE_HASH, 2)
  val r = get_max_entries(a)
  val p = bpf_map_lookup_elem(a,ref(0))
  println("The max entries of map is " ++ r.show)
}