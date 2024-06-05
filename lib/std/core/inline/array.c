#include "kklib.h"

/* --------------------------------------------------------------------------
Stack allocated arrays
*/

typedef struct {
    ssize_t size;
    uint32_t* data;
} kk_array;

// Array allocation and initialization
kk_box_t kk_with_array_512(kk_function_t f, kk_context_t* ctx) {
    kk_array arr;
    uint32_t data[512];
    arr.size = 0;
    arr.data = &data[0];
    return kk_function_call(kk_box_t,(kk_function_t,intptr_t,kk_context_t*),f,(f,(intptr_t)&arr,ctx),ctx);
}

kk_std_core_types__maybe kk_array_get(kk_array* arr, ssize_t i, kk_context_t* ctx) {
  if (i >= arr->size) {
    return kk_std_core_types__new_Nothing(ctx);
  }
  return kk_std_core_types__new_Just(kk_int32_box(arr->data[i], ctx), ctx);
}

kk_std_core_types__maybe kk_array_set(kk_array* arr, ssize_t i, uint32_t x, kk_context_t* ctx) {
  if (i >= 512) {
    return kk_std_core_types__new_Nothing(ctx);
  }
  arr->data[i] = x;
  arr->size = i+1;
  return kk_std_core_types__new_Just(kk_unit_box(kk_Unit), ctx);
}