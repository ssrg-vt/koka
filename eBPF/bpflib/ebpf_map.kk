module eBPF/bpflib/ebpf_map

import eBPF/bpflib/bpf_helpers_check
import std/core/int

pub ref struct eBPF_map<a,b> 
  map_type : bpf_map_type 
  max_entries : int
 
pub extern bpf_map_lookup_elem (m : eBPF_map<a,b>, k : ref<h,a>) : ref<h,b>
  c inline "bpf_map_lookup_elem(#1, #2)"





