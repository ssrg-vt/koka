module eBPF/bpflib/ip

import std/num/int32
import std/num/int64 

// https://github.com/torvalds/linux/blob/master/include/uapi/linux/ip.h

pub struct struct_group 
  saddr : int32
  daddr : int32 

pub struct iphdr 
  tos : int32 // needs to be u8: use shr twice 
  tot_len : int32 // needs to be __be16 : use shr once 
  id : int32 // needs to be __be16 : use shr once 
  frag_off : int32 // needs to be __be16 : use shr once
  ttl : int32 // needs to be u8: use shr twice 
  protocol : int32 // needs to be u8: use shr twice 
  check : int32 // needs to be u16 : use shr once 
  addrs : struct_group 


