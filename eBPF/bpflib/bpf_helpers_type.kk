/*
module eBPF/bpflib/bpf_helpers_type

import std/os/path
import std/os/file 
import std/core/console
import eBPF/bpflib/bpf
import std/core/types
import std/core/int
import std/num/int32

// https://elixir.bootlin.com/linux/latest/source/kernel/bpf/helpers.c


effect gpl_only {}

effect pkt_access {}

pub value type foo_proto 
   Foo_proto { arg1 : int32
               arg2 : int32
             }

pub fun bpf_map_lookup_elem(a : bpf_arg_type = ARG_CONST_MAP_PTR, b : bpf_arg_type = ARG_PTR_TO_MAP_KEY) : <pkt_access> bpf_return_type
   return RET_PTR_TO_MAP_VALUE_OR_NULL
   //println("Hello from bpf_map_lookup_elem")
  //c "bpf_map_lookup_elem"

pub fun get_arg1_foo (f : foo_proto = Foo_proto(20.int32,50.int32)) : int32
  return f.arg1

pub fun main()
  var r := get_arg1_foo()
  println("The foo arg1 is " ++ r.show) */
