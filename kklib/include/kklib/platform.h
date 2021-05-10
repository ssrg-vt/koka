#pragma once
#ifndef KK_PLATFORM_H
#define KK_PLATFORM_H

/*---------------------------------------------------------------------------
  Copyright 2020 Daan Leijen, Microsoft Corporation.

  This is free software; you can redistribute it and/or modify it under the
  terms of the Apache License, Version 2.0. A copy of the License can be
  found in the file "license.txt" at the root of this distribution.
---------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------
  Platform: we assume:
  - C99 as C compiler (syntax and library), with possible C11 extensions for threads and atomics.
  - either a 32- or 64-bit platform (but others should be possible with few changes)
  - the compiler can do a great job on small static inline definitions (and we avoid #define's).
  - the compiler will inline small structs (like `struct kk_box_s{ uintptr_t u; }`) without
    overhead (e.g. pass it in a register). This allows for better static checking.
  - (>>) on signed integers is an arithmetic right shift (i.e. sign extending)
  - a char/byte is 8 bits
  - either little-endian, or big-endian
  - carefully code with strict aliasing in mind 
--------------------------------------------------------------------------------------*/
#ifdef __cplusplus
#define kk_decl_externc    extern "C"
#else
#define kk_decl_externc    extern
#endif

#ifdef __STDC_VERSION__
#if (__STDC_VERSION__ >= 201112L)
#define KK_C11  1
#endif
#if (__STDC_VERSION__ >= 199901L) 
#define KK_C99  1
#endif
#endif

#ifdef __cplusplus
#if (__cplusplus >= 201703L)
#define KK_CPP17  1
#endif
#if (__cplusplus >= 201402L)
#define KK_CPP14  1
#endif
#if (__cplusplus >= 201103L) || (_MSC_VER > 1900) 
#define KK_CPP11  1
#endif
#endif

#if defined(_WIN32) && !defined(WIN32)
#define WIN32  1
#endif

#if defined(KK_CPP11)
#define kk_constexpr      constexpr
#else
#define kk_constexpr
#endif

#if defined(_MSC_VER) || defined(__MINGW32__)
#if !defined(SHARED_LIB)
#define kk_decl_export     kk_decl_externc
#elif defined(SHARED_LIB_EXPORT)
#define kk_decl_export     __declspec(dllexport)
#else
#define kk_decl_export     __declspec(dllimport)
#endif
#elif defined(__GNUC__) // includes clang and icc
#define kk_decl_export     kk_decl_externc __attribute__((visibility("default"))) 
#else
#define kk_decl_export     kk_decl_externc
#endif

#if defined(__GNUC__)
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wunused-value"
#define kk_unlikely(h)     __builtin_expect((h),0)
#define kk_likely(h)       __builtin_expect((h),1)
#define kk_decl_const      __attribute__((const))    // reads no global state at all
#define kk_decl_pure       __attribute__((pure))     // may read global state but has no observable side effects
#define kk_decl_noinline   __attribute__((noinline))
#define kk_decl_align(a)   __attribute__((aligned(a)))
#define kk_decl_thread     __thread
#elif defined(_MSC_VER)
#pragma warning(disable:4214)  // using bit field types other than int
#pragma warning(disable:4101)  // unreferenced local variable
#pragma warning(disable:4204)  // non-constant aggregate initializer
#pragma warning(disable:4068)  // unknown pragma
#pragma warning(disable:4996)  // POSIX name deprecated
#define kk_unlikely(x)     (x)
#define kk_likely(x)       (x)
#define kk_decl_const
#define kk_decl_pure
#define kk_decl_noinline   __declspec(noinline)
#define kk_decl_align(a)   __declspec(align(a))
#define kk_decl_thread     __declspec(thread)
#else
#define kk_unlikely(h)     (h)
#define kk_likely(h)       (h)
#define kk_decl_const
#define kk_decl_pure
#define kk_decl_noinline   
#define kk_decl_align(a)   
#define kk_decl_thread     __thread
#endif

// Assertions; kk_assert_internal is only enabled when KK_DEBUG_FULL is defined
#define kk_assert(x)          assert(x)
#ifdef KK_DEBUG_FULL
#define kk_assert_internal(x) kk_assert(x)
#else
#define kk_assert_internal(x) 
#endif

#ifndef KK_UNUSED
#define KK_UNUSED(x)          ((void)(x))
#ifdef NDEBUG
#define KK_UNUSED_RELEASE(x)  KK_UNUSED(x)
#else
#define KK_UNUSED_RELEASE(x)  
#endif
#ifndef KK_DEBUG_FULL
#define KK_UNUSED_INTERNAL(x)  KK_UNUSED(x)
#else
#define KK_UNUSED_INTERNAL(x)  
#endif
#endif

// Defining constants of a specific size
#if LONG_MAX == INT64_MAX
# define KK_LONG_SIZE   8
# define KI32(i)        (i)
# define KI64(i)        (i##L)
# define KU32(i)        (i##U)
# define KU64(i)        (i##UL)
#elif LONG_MAX == INT32_MAX
# define KK_LONG_SIZE 4
# define KI32(i)        (i##L)
# define KI64(i)        (i##LL)
# define KU32(i)        (i##UL)
# define KU64(i)        (i##ULL)
#else
#error size of a `long` must be 32 or 64 bits
#endif

// Define size of intptr_t
#if INTPTR_MAX == INT64_MAX           // 9223372036854775807LL
# define KK_INTPTR_SIZE 8
# define KIP(i)         KI64(i)
# define KUP(i)         KU64(i)
#elif INTPTR_MAX == INT32_MAX         // 2147483647LL
# define KK_INTPTR_SIZE 4
# define KIP(i)         KI32(i)
# define KUP(i)         KU32(i)
#else
#error platform must be 32 or 64 bits
#endif
#define KK_INTPTR_BITS        (8*KK_INTPTR_SIZE)
#define KK_INTPTR_ALIGNUP(x)  ((((x)+KK_INTPTR_SIZE-1)/KK_INTPTR_SIZE)*KK_INTPTR_SIZE)

// Define size of size_t and ssize_t 
#if SIZE_MAX == UINT64_MAX           // 18446744073709551615LL
# define KK_SIZE_SIZE   8
# define KIZ(i)         KI64(i)
# define KUZ(i)         KU64(i)
# define KK_SSIZE_MAX   INT64_MAX
# define KK_SSIZE_MIN   INT64_MIN
typedef int64_t         kk_ssize_t;
#elif SIZE_MAX == UINT32_MAX         // 4294967295LL
# define KK_SIZE_       SIZE 4
# define KIZ(i)         KI32(i)
# define KUZ(i)         KU32(i)
# define KK_SSIZE_MAX   INT32_MAX
# define KK_SSIZE_MIN   INT32_MIN
typedef int32_t         kk_ssize_t;
#else
#error size of a `size_t` must be 32 or 64 bits
#endif
#define KK_SIZE_BITS   (8*KK_SIZE_SIZE)

// off_t: we always use 64-bit file offsets
typedef int64_t     kk_off_t;
#define KK_OFF_MAX  INT64_MAX
#define KK_OFF_MIN  INT64_MIN


// We limit the maximum object size (arrays) to at most `PTRDIFF_MAX` bytes so we can
// always use _signed_ size_t (`kk_ssize_t`) to avoid:
// - signed/unsigned conversion (especially when mixing pointer arithmetic and lengths),
// - errors with overflow detection (consider `size > SIZE_MAX` versus `ssize > SSIZE_MAX`),
// - loop bound errors (consider `for(unsigned u = 0; u < len()-1; u++)` if `len()` happens to be `0` etc.),
// - performance degradation -- modern compilers can compile signed loop variables better (as signed overflow is undefined),
// - api usage(passing a negative value is easier to detect)
//
// A drawback is that this limits object sizes to half the address space-- for 64-bit
// this is not a problem but string lengths for example on 32-bit are limited to be
// "just" 2^31 bytes at most. Nevertheless, we feel this is an acceptible trade-off 
// (especially since `malloc` nowadays is already limited to `PTRDIFF_MAX`).
// Another more serious drawback is that signed overflow is undefined behaviour (!) so we
// need to be extra careful with calculations that may overflow.
//
// We also need some helpers to deal with API's (like `strlen`) that use `size_t` results or arguments,
// where we clamp the values into the range (but again, on modern systems this will not happen
// as these already limit the size of objects to SIZE_MAX/2 internally)

static inline kk_ssize_t kk_to_ssize_t(size_t sz) {
  kk_assert_internal(sz <= KK_SSIZE_MAX);
  return (kk_likely(sz <= KK_SSIZE_MAX) ? (kk_ssize_t)sz : KK_SSIZE_MAX);
}
static inline size_t kk_to_size_t(kk_ssize_t sz) {
  kk_assert_internal(sz >= 0);
  return (kk_likely(sz >= 0) ? (size_t)sz : 0);
}


// We define `kk_intx_t` as an integer with the natural (fast) machine register size. 
// We define it such that `sizeof(kk_intx_t) == max(sizeof(long),sizeof(size_t))`. 
// (We cannot use just `long` as it is sometimes too short (as on Windows 64-bit where a `long` is 32 bits).
//  Similarly, `size_t` is sometimes too short as well (like on the x32 ABI with a 64-bit `long` but 32-bit addresses)).
#if (ULONG_MAX < SIZE_MAX)
typedef kk_ssize_t     kk_intx_t;
typedef size_t         kk_uintx_t;
#define KUX(i)         KUZ(i)
#define KIX(i)         KIZ(i)
#define KK_INTX_SIZE   KK_SIZE_SIZE
#define KK_INTX_MAX    KK_SSIZE_MAX
#define KK_INTX_MIN    KK_SSIZE_MIN
#define PRIdIX         "%zd"
#define PRIuUX         "%zu"
#define PRIxUX         "%zx"
#define PRIXUX         "%zX"
#else 
typedef long           kk_intx_t;
typedef unsigned long  kk_uintx_t;
#define KUX(i)         (i##UL)
#define KIX(i)         (i##L)
#define KK_INTX_SIZE   KK_LONG_SIZE
#define KK_INTX_MAX    LONG_MAX
#define KK_INTX_MIN    LONG_MIN
#define PRIdIX         "%ld"
#define PRIuUX         "%lu"
#define PRIxUX         "%lx"
#define PRIXUX         "%lX"
#endif
#define KK_INTX_BITS   (8*KK_INTX_SIZE)


// Distinguish unsigned shift right and signed arithmetic shift right.
static inline kk_intx_t   kk_sar(kk_intx_t i, kk_intx_t shift)   { return (i >> shift); }
static inline kk_uintx_t  kk_shr(kk_uintx_t u, kk_uintx_t shift) { return (u >> shift); }
static inline int32_t     kk_sar32(int32_t i, kk_intx_t shift)   { return (i >> shift); }
static inline uint32_t    kk_shr32(uint32_t u, kk_uintx_t shift) { return (u >> shift); }
static inline int64_t     kk_sar64(int64_t i, kk_intx_t shift)   { return (i >> shift); }
static inline uint64_t    kk_shr64(uint64_t u, kk_uintx_t shift) { return (u >> shift); }

// Architecture assumptions
#define KK_ARCH_LITTLE_ENDIAN   1
//#define KK_ARCH_BIG_ENDIAN       1

#define KK_FUNPTR_SIZE          KK_INTPTR_SIZE    // the size of function pointer: `void (*f)(void)`


#endif // include guard
