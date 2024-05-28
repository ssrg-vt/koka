module eBPF/bpflib/ebpf_map

import eBPF/bpflib/bpf_helpers_check
import std/num/int64

/*
pub struct eBPF_map 
  map_type : bpf_map_type // needs to an array of 
  max_entries : int 
  key : ref int64
  value : ref (int) */
