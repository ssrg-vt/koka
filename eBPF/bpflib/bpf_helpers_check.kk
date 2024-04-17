module eBPF/bpflib/bpf_helpers_check

import eBPF/bpflib/bpf
import std/data/avl
import std/data/map
import std/num/int32
import std/core/order

//https://elixir.bootlin.com/linux/v4.8/source/kernel/bpf/helpers.c

pub fip fun extract_enum_bpf_cmd (bc : bpf_cmd) : int32 
  match bc 
    BPF_MAP_CREATE -> 0.int32
    BPF_MAP_LOOKUP_ELEM -> 1.int32
    BPF_MAP_UPDATE_ELEM -> 2.int32
    BPF_MAP_DELETE_ELEM -> 3.int32
    BPF_MAP_GET_NEXT_KEY -> 4.int32
    BPF_PROG_LOAD -> 5.int32
    BPF_OBJ_PIN -> 6.int32
    BPF_OBJ_GET -> 7.int32
    BPF_PROG_ATTACH -> 8.int32
    BPF_PROG_DETACH -> 9.int32
    BPF_PROG_TEST_RUN -> 10.int32
    BPF_PROG_RUN -> 11.int32
    BPF_PROG_GET_NEXT_ID -> 12.int32
    BPF_MAP_GET_NEXT_ID -> 13.int32
    BPF_PROG_GET_FD_BY_ID -> 14.int32
    BPF_MAP_GET_FD_BY_ID -> 15.int32
    BPF_OBJ_GET_INFO_BY_FD -> 16.int32
    BPF_PROG_QUERY -> 17.int32
    BPF_RAW_TRACEPOINT_OPEN -> 18.int32
    BPF_BTF_LOAD -> 19.int32
    BPF_BTF_GET_FD_BY_ID -> 20.int32
    BPF_TASK_FD_QUERY -> 21.int32
    BPF_MAP_LOOKUP_AND_DELETE_ELEM -> 22.int32
    BPF_MAP_FREEZE -> 23.int32
    BPF_BTF_GET_NEXT_ID -> 24.int32
    BPF_MAP_LOOKUP_BATCH -> 25.int32
    BPF_MAP_LOOKUP_AND_DELETE_BATCH -> 26.int32
    BPF_MAP_UPDATE_BATCH -> 27.int32
    BPF_MAP_DELETE_BATCH -> 28.int32
    BPF_LINK_CREATE -> 29.int32
    BPF_LINK_UPDATE -> 30.int32
    BPF_LINK_GET_FD_BY_ID -> 31.int32
    BPF_LINK_GET_NEXT_ID -> 32.int32
    BPF_ENABLE_STATS -> 33.int32
    BPF_ITER_CREATE -> 34.int32
    BPF_LINK_DETACH -> 35.int32
    BPF_PROG_BIND_MAP -> 36.int32

pub fip fun bpf_cmd_cmp (bc1 : bpf_cmd, bc2 : bpf_cmd) : order 
  val i1 = extract_enum_bpf_cmd(bc1) 
  val i2 = extract_enum_bpf_cmd(bc2)
  int32/cmp(i1, i2)

pub fun bpf_map_lookup_elem_proto (m : map<bpf_cmd,bpf_func_proto>) : bool 
  val v = map/get(m, BPF_MAP_LOOKUP_ELEM, bpf_cmd_cmp)
  match v 
    Nothing -> False
    Just(eBPF/bpflib/bpf/Bpf_func_proto (gpl, _, _, rt, a1, a2, _, _, _)) -> 
               match gpl
                True -> False
                False -> match rt 
                          RET_PTR_TO_MAP_VALUE_OR_NULL -> match a1
                                                            ARG_CONST_MAP_PTR -> match a2 
                                                                                  ARG_PTR_TO_MAP_KEY -> True
                                                                                  _ -> False
                                                            _ -> False
                          _ -> False


pub fun check_hf_proto (m : map<bpf_cmd,bpf_func_proto>, hf : bpf_cmd): bool 
  val v = map/get(m, hf, bpf_cmd_cmp)
  match v 
    Nothing -> False
    Just(_) -> True 

pub fun main()
  println("success")


