module bpf/bpflib/bpf_map

pub ref struct sec ".maps" bpf_map<a,b> 
  map_type : bpf_map_type 
  max_entries : int
  key_type : a
  value_type : b
  map_flags : flag_map
