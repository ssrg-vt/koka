// Stack-allocated arrays 

module std/core/array

import std/core/types
import std/core/exn
import std/core/hnd
import std/core/int
import std/core/console
 
extern import
  c file "inline/array"

struct array<s::S> { internal: intptr_t }

extern unsafe-with-array(f: (intptr_t) -> <div,ndet,console> a): <div,ndet,console> a
  c "kk_with_array_512"

pub fun with-array(f: forall<s::S> (array<s>) -> <div,ndet,console> a): <div,ndet,console> a
  unsafe-with-array fn(a) f(Array(a))

extern unsafe-get-array(a: intptr_t, i: int32): <div,ndet,console> maybe<int32>
  c inline "kk_array_get((kk_array*)#1, #2, kk_context())"

pub fun get(array: array<s::S>, i: int32): <div,ndet,console> maybe<int32>
  unsafe-get-array(array.internal, i)

extern unsafe-set-array(a: intptr_t, i: int32, v: int32): <div,ndet,console> maybe<()>
  c inline "kk_array_set((kk_array*)#1, #2, #3, kk_context())"

pub fun array/set(array: array<s::S>, i: int32, v: int32): <div,ndet,console> maybe<()>
  unsafe-set-array(array.internal, i, v)

/*
// Length of an array
extern array-capacity (a : arrayty<a,n>) : int 
  c inline "sizeof(a)"

pub fun lengtha (a : arrayty<a, n>) 
  array-capacity(a)

// Create a new array of length `n`  with initial elements `init`` .
extern array-alloc(name : string, n : int, init : a) : e arrayty<a,n>
  c inline "int name[#2]"

// Create a new array of length `n`  with initial elements `default` .
pub fun array-create(name: string, n : int, default : a) : arrayty<a,n>
  array-alloc(name, n, default)

/* Convert a list to a vector.
pub fun list/array( xs : list<a> ) 
  xs.unalist

extern unalist( xs : list<a> ) : int 
  return 0;*/ 
*/