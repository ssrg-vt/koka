module eBPF/bpflib/bpf

import std/core/types
import std/core/int
import std/num/int32

/* https://elixir.bootlin.com/linux/v4.9/source/include/uapi/linux/bpf.h */

/* User return code for XDP prog type:
   A valid XDP program must return one of these valid field. 
   All other return codes are reserved for future use. 
   Unknown return codes will result in packet drops and a warning vid bpf_warn_invalid_xdp_action()
 */
pub type xdp_action {
  XDP_ABORTED 
  XDP_DROP
  XDP_PASS
  XDP_TX
  XDP_REDIRECT
}

pub fun xdp_action_show( xdp : xdp_action ) : string
  match xdp
    XDP_ABORTED -> "XDP_ABORTED"
    XDP_DROP -> "XDP_DROP"
    XDP_PASS -> "XDP_PASS"
    XDP_TX -> "XDP_TX"
    XDP_REDIRECT -> "XDP_REDIRECT"

pub ref struct xdp_md 
  data : int32       // pointer to beginning of the packet data // should be changed to unsigned int
  data_end : int32  // pointer to the end of the packet data // should be changed to unsigned int
  data_meta : int32 // meta data
  // Below access go through struct xdp_rxq_info // should be changed to unsigned int
  ingress_ifindex : int32 // rxq->dev->ifindex 
  rx_queue_index : int32  // rxq->queue_index  
  egress_ifindex : int32 // txq->dev->ifindex 

pub type bpf_cmd
  BPF_MAP_CREATE
  BPF_MAP_LOOKUP_ELEM
  BPF_MAP_UPDATE_ELEM
  BPF_MAP_DELETE_ELEM
  BPF_MAP_GET_NEXT_KEY
  BPF_PROG_LOAD
  BPF_OBJ_PIN
  BPF_OBJ_GET
  BPF_PROG_ATTACH
  BPF_PROG_DETACH
  BPF_PROG_TEST_RUN
  BPF_PROG_RUN 
  BPF_PROG_GET_NEXT_ID
  BPF_MAP_GET_NEXT_ID
  BPF_PROG_GET_FD_BY_ID
  BPF_MAP_GET_FD_BY_ID
  BPF_OBJ_GET_INFO_BY_FD
  BPF_PROG_QUERY
  BPF_RAW_TRACEPOINT_OPEN
  BPF_BTF_LOAD
  BPF_BTF_GET_FD_BY_ID
  BPF_TASK_FD_QUERY
  BPF_MAP_LOOKUP_AND_DELETE_ELEM
  BPF_MAP_FREEZE
  BPF_BTF_GET_NEXT_ID
  BPF_MAP_LOOKUP_BATCH
  BPF_MAP_LOOKUP_AND_DELETE_BATCH
  BPF_MAP_UPDATE_BATCH
  BPF_MAP_DELETE_BATCH
  BPF_LINK_CREATE
  BPF_LINK_UPDATE
  BPF_LINK_GET_FD_BY_ID
  BPF_LINK_GET_NEXT_ID
  BPF_ENABLE_STATS
  BPF_ITER_CREATE
  BPF_LINK_DETACH
  BPF_PROG_BIND_MAP

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




