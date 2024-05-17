module std/core/array

import std/core/types
import std/core/int 

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
