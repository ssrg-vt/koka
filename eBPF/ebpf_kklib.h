#include <limits.h>           // LONG_MAX, ...
#include <stddef.h>           // size_t
#include <stdbool.h>          // bool
#include <stdint.h>           // int64_t, ...
#include <inttypes.h>         // PRIx64, ...
#include <assert.h>           // assert
#include <errno.h>            // ENOSYS, ...
#include <stdlib.h>           // malloc, abort, ...
#include <string.h>           // strlen, memcpy, ...
#include <math.h>             // isnan, isfinite, ...
#include <stdio.h>            // FILE*, printf, ...

#include</home/swarnp/research/koka/eBPF/eBPF_kklib/platform.h>
//#include </home/swarnp/research/koka/eBPF/examples/pid_gid/working/eBPF_kklib/platform.h>

/*--------------------------------------------------------------------------------------
  Tags
--------------------------------------------------------------------------------------*/

// Tags for heap blocks
typedef enum kk_tag_e {
    KK_TAG_BIGINT     // big integer (see `integer.c`)
} kk_tag_t;

typedef long kk_integer_t;

/* Added a simplified kk_context_t definition by removing all fields and keeping just 2*/
typedef struct kk_context_s {
  int64_t        argc;             // command line argument count
  const char**      argv;          // command line arguments       
} kk_context_t;

// The current context is passed as a _ctx parameter in the generated code
#define kk_context()  _ctx

// The unit type
typedef enum kk_unit_e {
  kk_Unit = 0
} kk_unit_t;

typedef intptr_t kk_intb_t;

typedef kk_intb_t kk_datatype_t;

/*----------------------------------------------------------------------
  Low-level encoding of small integers (`kk_intf_t`) and pointers
  into a boxed integer `kk_intb_t`.
----------------------------------------------------------------------*/
// We generally tag boxed values; the least-significant bit is clear for heap pointers (`kk_ptr_t == kk_block_t*`),
// while the bit is set for values.
#define KK_TAG_BITS             (1)
#define KK_TAG_MASK             ((1<<KK_TAG_BITS)-1)
#define KK_TAG_PTR              (0)
#define KK_TAG_VALUE            (1)

static inline bool kk_is_ptr(kk_intb_t i) {
  return ((i & KK_TAG_MASK) == KK_TAG_PTR);
}
static inline bool kk_is_value(kk_intb_t i) {
  return !kk_is_ptr(i);
}

// Integer value encoding/decoding. May use smaller integers (`kk_intf_t`)
// then boxed integers if `kk_intb_t` is larger than the natural register size.
#define KK_INTF_BOX_BITS(extra)  (KK_INTF_BITS - (KK_TAG_BITS + (extra)))
#define KK_INTF_BOX_MAX(extra)   (KK_INTF_MAX >> (KK_TAG_BITS + (extra)))
#define KK_INTF_BOX_MIN(extra)   (-KK_INTF_BOX_MAX(extra) - 1)
#define KK_UINTF_BOX_MAX(extra)  (KK_UINTF_MAX >>(KK_TAG_BITS + (extra)))

static inline kk_intb_t kk_intf_encode(kk_intf_t i, int extra_shift) {
  kk_assert_internal(extra_shift >= 0);
  kk_intb_t b = i; // may sign-extend
  kk_assert_internal(b >= KK_INTF_BOX_MIN(extra_shift) && i <= KK_INTF_BOX_MAX(extra_shift));
  return (kk_shlb(b,KK_TAG_BITS + extra_shift) | KK_TAG_VALUE);
}

static inline kk_intf_t kk_intf_decode(kk_intb_t b, int extra_shift) {
  kk_assert_internal(extra_shift >= 0);
  kk_assert_internal(kk_is_value(b) || b == kk_get_context()->kk_box_any.dbox);
  kk_intb_t i = kk_sarb( b, KK_TAG_BITS + extra_shift);
  kk_assert_internal(i >= KK_INTF_MIN && i <= KK_INTF_MAX);
  return (kk_intf_t)i;
}