module bpf/bpflib/bpf

/* https://elixir.bootlin.com/linux/v6.9-rc7/source/include/uapi/linux/bpf.h */

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

pub ref struct bpf_pidns_info 
  pid : int32
  tgid : int32

/* user accessible mirror of in-kernel sk_buff.
 * new fields can only be added to the end of this structure
 */
pub ref struct sk_buff //__sk_buff
  len : int32
  pkt_type : int32
  mark : int32
  queue_mapping : int32
  protocol : int32
  vlan_present : int32 
  vlan_tci : int32
  vlan_proto : int32
  priority : int32
  ingress_ifindex : int32 
  ifindex : int32
  tc_index : int32
  //cb : array of int of size 5 (* add later: __u32 cb[5] *)
  hash : int32
  tc_classid : int32
  data : int32
  data_end : int32
  napi_id : int32
  /* Accessed by BPF_PROG_TYPE_sk_skb types from here to ... */
  family : int32
  /* stored in network byte order */
  remote_ip4 : int32
  local_ip4 : int32
  //remote_ip6 : array of size 4 of type int (* add later: __u32 remote_ip6[4] *)
  //local_ip6 : array of size 4 of type int (* add later: __u32 local_ip6[4] *)
  /* stored in host byte order */
  local_port : int32
  data_meta : int32
  //__bpf_md_ptr(struct bpf_flow_keys *, flow_keys); (* add later *)
  tstamp : int64 
  wire_len : int32
  gso_segs : int32
  //__bpf_md_ptr(struct bpf_sock *, sk);(* add later *)
  gso_size : int32 
  tstamp_type : int32 // use int8 instead 
  // 	__u32 :24;		/* Padding, future use. */ (* add later *)
  hwtstamp : int64


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

pub type bpf_cmd
  BPF_MAP_CREATE
  BPF_MAP_LOOKUP_ELEM
  BPF_MAP_UPDATE_ELEM
  BPF_MAP_DELETE_ELEM
  BPF_GET_CURRENT_UID_GID 
  BPF_GET_CURRENT_PID_TGID 

pub type flag_map
  BPF_ANY       /* create new element or update existing */
  BPF_NOEXIST   /* create new element if it didn't exist */
  BPF_EXIST     /* update existing element */

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

/* bpf_context is intentionally undefined structure. Pointer to bpf_context is
 * the first argument to eBPF programs.
 * For socket filters: 'struct bpf_context *' == 'struct sk_buff *'
 * For xdp programs: 'struct bpf_context *' == 'struct xdp_md *'
 */
pub struct bpf_context;

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
  
