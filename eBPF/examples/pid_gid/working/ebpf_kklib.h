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

typedef long kk_integer_t;

/* Added a simplified kk_context_t definition by removing all fields and keeping just 2*/
typedef struct kk_context_s {
  int64_t        argc;             // command line argument count
  const char**      argv;          // command line arguments       
} kk_context_t;

// The unit type
typedef enum kk_unit_e {
  kk_Unit = 0
} kk_unit_t;

typedef intptr_t kk_intb_t;

typedef kk_intb_t kk_datatype_t;

typedef kk_datatype_t kk_bytes_t;

typedef kk_bytes_t kk_string_t;
