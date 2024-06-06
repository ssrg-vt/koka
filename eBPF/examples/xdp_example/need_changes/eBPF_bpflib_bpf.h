#pragma once
#ifndef kk_eBPF_bpflib_bpf_H
#define kk_eBPF_bpflib_bpf_H
// Koka generated module: eBPF/bpflib/bpf, koka version: 3.1.0, platform: 64-bit
#include <kklib.h>
#include "std_core_hnd.h"
#include "std_core_exn.h"
#include "std_core_bool.h"
#include "std_core_order.h"
#include "std_core_char.h"
#include "std_core_vector.h"
#include "std_core_string.h"
#include "std_core_sslice.h"
#include "std_core_list.h"
#include "std_core_maybe.h"
#include "std_core_either.h"
#include "std_core_tuple.h"
#include "std_core_show.h"
#include "std_core_debug.h"
#include "std_core_delayed.h"
#include "std_core_console.h"
#include "std_core.h"
#include "std_core_types.h"
#include "std_core_int.h"
#include "std_num_int32.h"

// type declarations

// value type eBPF/bpflib/bpf/xdp_action
enum kk_eBPF_bpflib_bpf__xdp__action_e {
  kk_eBPF_bpflib_bpf_XDP__ABORTED,
  kk_eBPF_bpflib_bpf_XDP__DROP,
  kk_eBPF_bpflib_bpf_XDP__PASS,
  kk_eBPF_bpflib_bpf_XDP__TX,
  kk_eBPF_bpflib_bpf_XDP__REDIRECT
};
typedef uint32_t kk_eBPF_bpflib_bpf__xdp__action;

static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_bpflib_bpf__new_XDP__ABORTED(kk_context_t* _ctx) {
  return kk_eBPF_bpflib_bpf_XDP__ABORTED;
}
static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_bpflib_bpf__new_XDP__DROP(kk_context_t* _ctx) {
  return kk_eBPF_bpflib_bpf_XDP__DROP;
}
static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_bpflib_bpf__new_XDP__PASS(kk_context_t* _ctx) {
  return kk_eBPF_bpflib_bpf_XDP__PASS;
}
static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_bpflib_bpf__new_XDP__TX(kk_context_t* _ctx) {
  return kk_eBPF_bpflib_bpf_XDP__TX;
}
static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_bpflib_bpf__new_XDP__REDIRECT(kk_context_t* _ctx) {
  return kk_eBPF_bpflib_bpf_XDP__REDIRECT;
}
static inline bool kk_eBPF_bpflib_bpf__is_XDP__ABORTED(kk_eBPF_bpflib_bpf__xdp__action x, kk_context_t* _ctx) {
  return (x == kk_eBPF_bpflib_bpf_XDP__ABORTED);
}
static inline bool kk_eBPF_bpflib_bpf__is_XDP__DROP(kk_eBPF_bpflib_bpf__xdp__action x, kk_context_t* _ctx) {
  return (x == kk_eBPF_bpflib_bpf_XDP__DROP);
}
static inline bool kk_eBPF_bpflib_bpf__is_XDP__PASS(kk_eBPF_bpflib_bpf__xdp__action x, kk_context_t* _ctx) {
  return (x == kk_eBPF_bpflib_bpf_XDP__PASS);
}
static inline bool kk_eBPF_bpflib_bpf__is_XDP__TX(kk_eBPF_bpflib_bpf__xdp__action x, kk_context_t* _ctx) {
  return (x == kk_eBPF_bpflib_bpf_XDP__TX);
}
static inline bool kk_eBPF_bpflib_bpf__is_XDP__REDIRECT(kk_eBPF_bpflib_bpf__xdp__action x, kk_context_t* _ctx) {
  return (x == kk_eBPF_bpflib_bpf_XDP__REDIRECT);
}
static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_bpflib_bpf__xdp__action_dup(kk_eBPF_bpflib_bpf__xdp__action _x, kk_context_t* _ctx) {
  return _x;
}
static inline void kk_eBPF_bpflib_bpf__xdp__action_drop(kk_eBPF_bpflib_bpf__xdp__action _x, kk_context_t* _ctx) {
  
}
static inline kk_box_t kk_eBPF_bpflib_bpf__xdp__action_box(kk_eBPF_bpflib_bpf__xdp__action _x, kk_context_t* _ctx) {
  return kk_enum_box(_x);
}
static inline kk_eBPF_bpflib_bpf__xdp__action kk_eBPF_bpflib_bpf__xdp__action_unbox(kk_box_t _x, kk_borrow_t _borrow, kk_context_t* _ctx) {
  return (kk_eBPF_bpflib_bpf__xdp__action)kk_enum_unbox(_x);
}

// type eBPF/bpflib/bpf/xdp_md
struct kk_eBPF_bpflib_bpf__xdp__md_s {
  kk_block_t _block;
};
typedef kk_datatype_ptr_t kk_eBPF_bpflib_bpf__xdp__md;
struct kk_eBPF_bpflib_bpf_Xdp__md {
  struct kk_eBPF_bpflib_bpf__xdp__md_s _base;
  int32_t data;
  int32_t data__end;
  int32_t data__meta;
  int32_t ingress__ifindex;
  int32_t rx__queue__index;
  int32_t egress__ifindex;
};
static inline kk_eBPF_bpflib_bpf__xdp__md kk_eBPF_bpflib_bpf__base_Xdp__md(struct kk_eBPF_bpflib_bpf_Xdp__md* _x, kk_context_t* _ctx) {
  return kk_datatype_from_base(&_x->_base, _ctx);
}
static inline kk_eBPF_bpflib_bpf__xdp__md kk_eBPF_bpflib_bpf__new_Xdp__md(kk_reuse_t _at, int32_t _cpath, int32_t data, int32_t data__end, int32_t data__meta, int32_t ingress__ifindex, int32_t rx__queue__index, int32_t egress__ifindex, kk_context_t* _ctx) {
  struct kk_eBPF_bpflib_bpf_Xdp__md* _con = kk_block_alloc_at_as(struct kk_eBPF_bpflib_bpf_Xdp__md, _at, 0 /* scan count */, _cpath, (kk_tag_t)(1), _ctx);
  _con->data = data;
  _con->data__end = data__end;
  _con->data__meta = data__meta;
  _con->ingress__ifindex = ingress__ifindex;
  _con->rx__queue__index = rx__queue__index;
  _con->egress__ifindex = egress__ifindex;
  return kk_eBPF_bpflib_bpf__base_Xdp__md(_con, _ctx);
}
static inline struct kk_eBPF_bpflib_bpf_Xdp__md* kk_eBPF_bpflib_bpf__as_Xdp__md(kk_eBPF_bpflib_bpf__xdp__md x, kk_context_t* _ctx) {
  return kk_datatype_as_assert(struct kk_eBPF_bpflib_bpf_Xdp__md*, x, (kk_tag_t)(1), _ctx);
}
static inline bool kk_eBPF_bpflib_bpf__is_Xdp__md(kk_eBPF_bpflib_bpf__xdp__md x, kk_context_t* _ctx) {
  return (true);
}
static inline kk_eBPF_bpflib_bpf__xdp__md kk_eBPF_bpflib_bpf__xdp__md_dup(kk_eBPF_bpflib_bpf__xdp__md _x, kk_context_t* _ctx) {
  return kk_datatype_ptr_dup(_x, _ctx);
}
static inline void kk_eBPF_bpflib_bpf__xdp__md_drop(kk_eBPF_bpflib_bpf__xdp__md _x, kk_context_t* _ctx) {
  kk_datatype_ptr_drop(_x, _ctx);
}
static inline kk_box_t kk_eBPF_bpflib_bpf__xdp__md_box(kk_eBPF_bpflib_bpf__xdp__md _x, kk_context_t* _ctx) {
  return kk_datatype_ptr_box(_x);
}
static inline kk_eBPF_bpflib_bpf__xdp__md kk_eBPF_bpflib_bpf__xdp__md_unbox(kk_box_t _x, kk_borrow_t _borrow, kk_context_t* _ctx) {
  return kk_datatype_ptr_unbox(_x);
}

// value declarations
 
// Automatically generated. Tests for the `XDP_ABORTED` constructor of the `:xdp_action` type.

 static inline bool kk_eBPF_bpflib_bpf_is_xdp__ABORTED(kk_eBPF_bpflib_bpf__xdp__action xdp__action, kk_context_t* _ctx) { /* (xdp_action : xdp_action) -> bool */ 
  if (kk_eBPF_bpflib_bpf__is_XDP__ABORTED(xdp__action, _ctx)) {
    return true;
  }
  {
    return false;
  }
}
 
// Automatically generated. Tests for the `XDP_DROP` constructor of the `:xdp_action` type.

 static inline bool kk_eBPF_bpflib_bpf_is_xdp__DROP(kk_eBPF_bpflib_bpf__xdp__action xdp__action, kk_context_t* _ctx) { /* (xdp_action : xdp_action) -> bool */ 
  if (kk_eBPF_bpflib_bpf__is_XDP__DROP(xdp__action, _ctx)) {
    return true;
  }
  {
    return false;
  }
}
 
// Automatically generated. Tests for the `XDP_PASS` constructor of the `:xdp_action` type.

 static inline bool kk_eBPF_bpflib_bpf_is_xdp__PASS(kk_eBPF_bpflib_bpf__xdp__action xdp__action, kk_context_t* _ctx) { /* (xdp_action : xdp_action) -> bool */ 
  if (kk_eBPF_bpflib_bpf__is_XDP__PASS(xdp__action, _ctx)) {
    return true;
  }
  {
    return false;
  }
}
 
// Automatically generated. Tests for the `XDP_TX` constructor of the `:xdp_action` type.

 static inline bool kk_eBPF_bpflib_bpf_is_xdp__TX(kk_eBPF_bpflib_bpf__xdp__action xdp__action, kk_context_t* _ctx) { /* (xdp_action : xdp_action) -> bool */ 
  if (kk_eBPF_bpflib_bpf__is_XDP__TX(xdp__action, _ctx)) {
    return true;
  }
  {
    return false;
  }
}
 
// Automatically generated. Tests for the `XDP_REDIRECT` constructor of the `:xdp_action` type.

 static inline bool kk_eBPF_bpflib_bpf_is_xdp__REDIRECT(kk_eBPF_bpflib_bpf__xdp__action xdp__action, kk_context_t* _ctx) { /* (xdp_action : xdp_action) -> bool */ 
  if (kk_eBPF_bpflib_bpf__is_XDP__REDIRECT(xdp__action, _ctx)) {
    return true;
  }
  {
    return false;
  }
}
 
// Automatically generated. Retrieves the `data` constructor field of the `:xdp_md` type.

 static inline int32_t kk_eBPF_bpflib_bpf_xdp__md_fs_data(kk_eBPF_bpflib_bpf__xdp__md _this, kk_context_t* _ctx) { /* (xdp_md) -> int32 */ 
  {
    struct kk_eBPF_bpflib_bpf_Xdp__md* _con_x8 = kk_eBPF_bpflib_bpf__as_Xdp__md(_this, _ctx);
    int32_t _x = _con_x8->data;
    return _x;
  }
}
 
// Automatically generated. Retrieves the `data_end` constructor field of the `:xdp_md` type.

 static inline int32_t kk_eBPF_bpflib_bpf_xdp__md_fs_data__end(kk_eBPF_bpflib_bpf__xdp__md _this, kk_context_t* _ctx) { /* (xdp_md) -> int32 */ 
  {
    struct kk_eBPF_bpflib_bpf_Xdp__md* _con_x9 = kk_eBPF_bpflib_bpf__as_Xdp__md(_this, _ctx);
    int32_t _x = _con_x9->data__end;
    return _x;
  }
}
 
// Automatically generated. Retrieves the `data_meta` constructor field of the `:xdp_md` type.

 static inline int32_t kk_eBPF_bpflib_bpf_xdp__md_fs_data__meta(kk_eBPF_bpflib_bpf__xdp__md _this, kk_context_t* _ctx) { /* (xdp_md) -> int32 */ 
  {
    struct kk_eBPF_bpflib_bpf_Xdp__md* _con_x10 = kk_eBPF_bpflib_bpf__as_Xdp__md(_this, _ctx);
    int32_t _x = _con_x10->data__meta;
    return _x;
  }
}
 
// Automatically generated. Retrieves the `ingress_ifindex` constructor field of the `:xdp_md` type.

 static inline int32_t kk_eBPF_bpflib_bpf_xdp__md_fs_ingress__ifindex(kk_eBPF_bpflib_bpf__xdp__md _this, kk_context_t* _ctx) { /* (xdp_md) -> int32 */ 
  {
    struct kk_eBPF_bpflib_bpf_Xdp__md* _con_x11 = kk_eBPF_bpflib_bpf__as_Xdp__md(_this, _ctx);
    int32_t _x = _con_x11->ingress__ifindex;
    return _x;
  }
}
 
// Automatically generated. Retrieves the `rx_queue_index` constructor field of the `:xdp_md` type.

 static inline int32_t kk_eBPF_bpflib_bpf_xdp__md_fs_rx__queue__index(kk_eBPF_bpflib_bpf__xdp__md _this, kk_context_t* _ctx) { /* (xdp_md) -> int32 */ 
  {
    struct kk_eBPF_bpflib_bpf_Xdp__md* _con_x12 = kk_eBPF_bpflib_bpf__as_Xdp__md(_this, _ctx);
    int32_t _x = _con_x12->rx__queue__index;
    return _x;
  }
}
 
// Automatically generated. Retrieves the `egress_ifindex` constructor field of the `:xdp_md` type.

 static inline int32_t kk_eBPF_bpflib_bpf_xdp__md_fs_egress__ifindex(kk_eBPF_bpflib_bpf__xdp__md _this, kk_context_t* _ctx) { /* (xdp_md) -> int32 */ 
  {
    struct kk_eBPF_bpflib_bpf_Xdp__md* _con_x13 = kk_eBPF_bpflib_bpf__as_Xdp__md(_this, _ctx);
    int32_t _x = _con_x13->egress__ifindex;
    return _x;
  }
}

kk_eBPF_bpflib_bpf__xdp__md kk_eBPF_bpflib_bpf_xdp__md_fs__copy(kk_eBPF_bpflib_bpf__xdp__md _this, kk_std_core_types__optional data, kk_std_core_types__optional data__end, kk_std_core_types__optional data__meta, kk_std_core_types__optional ingress__ifindex, kk_std_core_types__optional rx__queue__index, kk_std_core_types__optional egress__ifindex, kk_context_t* _ctx); /* (xdp_md, data : ? int32, data_end : ? int32, data_meta : ? int32, ingress_ifindex : ? int32, rx_queue_index : ? int32, egress_ifindex : ? int32) -> xdp_md */ 

 static inline kk_string_t kk_eBPF_bpflib_bpf_xdp__action__show(kk_eBPF_bpflib_bpf__xdp__action xdp, kk_context_t* _ctx) { /* (xdp : xdp_action) -> string */ 
  if (kk_eBPF_bpflib_bpf__is_XDP__ABORTED(xdp, _ctx)) {
    kk_define_string_literal(, _s_x26, 11, "XDP_ABORTED", _ctx)
    return kk_string_dup(_s_x26, _ctx);
  }
  if (kk_eBPF_bpflib_bpf__is_XDP__DROP(xdp, _ctx)) {
    kk_define_string_literal(, _s_x27, 8, "XDP_DROP", _ctx)
    return kk_string_dup(_s_x27, _ctx);
  }
  if (kk_eBPF_bpflib_bpf__is_XDP__PASS(xdp, _ctx)) {
    kk_define_string_literal(, _s_x28, 8, "XDP_PASS", _ctx)
    return kk_string_dup(_s_x28, _ctx);
  }
  if (kk_eBPF_bpflib_bpf__is_XDP__TX(xdp, _ctx)) {
    kk_define_string_literal(, _s_x29, 6, "XDP_TX", _ctx)
    return kk_string_dup(_s_x29, _ctx);
  }
  {
    kk_define_string_literal(, _s_x30, 12, "XDP_REDIRECT", _ctx)
    return kk_string_dup(_s_x30, _ctx);
  }
}

void kk_eBPF_bpflib_bpf__init(kk_context_t* _ctx);


void kk_eBPF_bpflib_bpf__done(kk_context_t* _ctx);

#endif // header
