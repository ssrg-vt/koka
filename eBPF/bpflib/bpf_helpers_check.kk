module eBPF/bpflib/bpf_helpers_check

import eBPF/bpflib/bpf
import std/data/avl
import std/data/map
import std/num/int32
import std/core/order

//https://elixir.bootlin.com/linux/v4.8/source/kernel/bpf/helpers.c

pub type bpf_cmd
  BPF_MAP_CREATE
  BPF_MAP_LOOKUP_ELEM
  BPF_MAP_UPDATE_ELEM
  BPF_MAP_DELETE_ELEM
  BPF_GET_CURRENT_UID_GID 
  BPF_GET_CURRENT_PID_TGID 
  
pub type bpf_prog_type 
  BPF_PROG_TYPE_UNSPEC
  BPF_PROG_TYPE_SOCKET_FILTER
  BPF_PROG_TYPE_KPROBE
  BPF_PROG_TYPE_SCHED_CLS
  BPF_PROG_TYPE_SCHED_ACT
  BPF_PROG_TYPE_TRACEPOINT
  BPF_PROG_TYPE_XDP
  BPF_PROG_TYPE_PERF_EVENT
  BPF_PROG_TYPE_CGROUP_SKB
  BPF_PROG_TYPE_CGROUP_SOCK
  BPF_PROG_TYPE_LWT_IN
  BPF_PROG_TYPE_LWT_OUT
  BPF_PROG_TYPE_LWT_XMIT
  BPF_PROG_TYPE_SOCK_OPS
  BPF_PROG_TYPE_SK_SKB
  BPF_PROG_TYPE_CGROUP_DEVICE
  BPF_PROG_TYPE_SK_MSG
  BPF_PROG_TYPE_RAW_TRACEPOINT
  BPF_PROG_TYPE_CGROUP_SOCK_ADDR
  BPF_PROG_TYPE_LWT_SEG6LOCAL
  BPF_PROG_TYPE_LIRC_MODE2
  BPF_PROG_TYPE_SK_REUSEPORT
  BPF_PROG_TYPE_FLOW_DISSECTOR
  BPF_PROG_TYPE_CGROUP_SYSCTL
  BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE
  BPF_PROG_TYPE_CGROUP_SOCKOPT
  BPF_PROG_TYPE_TRACING
  BPF_PROG_TYPE_STRUCT_OPS
  BPF_PROG_TYPE_EXT
  BPF_PROG_TYPE_LSM
  BPF_PROG_TYPE_SK_LOOKUP
  BPF_PROG_TYPE_SYSCALL /* a program that can execute syscalls */
  BPF_PROG_TYPE_NETFILTER


/* bpf_context is intentionally undefined structure. Pointer to bpf_context is
 * the first argument to eBPF programs.
 * For socket filters: 'struct bpf_context *' == 'struct sk_buff *'
 * For xdp programs: 'struct bpf_context *' == 'struct xdp_md *'
 */
pub struct bpf_context;

pub type bpf_arg_type 
  ARG_DONTCARE      /* unused argument in helper function */
  /* the following constraints used to prototype
	 * bpf_map_lookup/update/delete_elem() functions
	 */
  ARG_CONST_MAP_PTR     /* const argument used as pointer to bpf_map */
  ARG_PTR_TO_MAP_KEY    /* pointer to stack used as map key */
  ARG_PTR_TO_MAP_VALUE  /* pointer to stack used as map value */
  /* the following constraints used to prototype bpf_memcmp() and other
	 * functions that access data on eBPF program stack
	 */
  ARG_PTR_TO_STACK      /* any pointer to eBPF program stack */
  ARG_PTR_TO_RAW_STACK  /* any pointer to eBPF program stack, area does not
				                 * need to be initialized, helper function must fill
				                 * all bytes or clear them in error case.
				                */

  ARG_CONST_STACK_SIZE   /* number of bytes accessed from stack */
  ARG_CONST_STACK_SIZE_OR_ZERO /* number of bytes accessed from stack or 0 */

  ARG_PTR_TO_CTX  /* pointer to context */
  ARG_ANYTHING    /* any (initialized) argument is ok */


/* type of values returned from helper functions */
pub type bpf_return_type 
  RET_INTEGER                   /* function returns integer */
  RET_VOID                      /* function doesn't return anything */
  RET_PTR_TO_MAP_VALUE_OR_NULL  /* returns a pointer to map elem value or NULL */

/* eBPF function prototype used by verifier to allow BPF_CALLs from eBPF programs
 * to in-kernel helper functions and for adjusting imm32 field in BPF_CALL
 * instructions after verifying
 */
pub value type bpf_func_proto 
  Bpf_func_proto { gpl_only : bool; 
                   pkt_access : bool; 
                   might_sleep : bool;
                   ret_type : bpf_return_type; 
                   arg1_type : bpf_arg_type;
                   arg2_type : bpf_arg_type;
                   arg3_type : bpf_arg_type;
                   arg4_type : bpf_arg_type;
                   arg5_type : bpf_arg_type }

// structure used by BPF_MAP_CREATE COMMAND 
pub value type bpf_attr 
  Bpf_attr { map_type : int32;      //one of enum bpf_map_type (it should contain the integer associated with constructor of enum type "bpf_map_type")
             key_size : int32;      //size of key in bytes
             value_size : int32;    //size of value in bytes
             max_entries : int32;   //max number of entries in a map
             map_flags : int32 }    //prealloc or not


/* Register Names */
pub type bpf_registers 
  BPF_REG_0
  BPF_REG_1
  BPF_REG_2
  BPF_REG_3
  BPF_REG_4
  BPF_REG_5
  BPF_REG_6
  BPF_REG_7
  BPF_REG_8
  BPF_REG_9
  BPF_REG_10




