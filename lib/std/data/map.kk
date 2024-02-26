/*---------------------------------------------------------------------------
  Copyright 2020-2021, Microsoft Research, Daan Leijen.

  This is free software; you can redistribute it and/or modify it under the
  terms of the Apache License, Version 2.0. A copy of the License can be
  found in the LICENSE file at the root of this distribution.
---------------------------------------------------------------------------*/

/* Map

   Todo.
*/
module std/data/map

import std/data/avl
import std/core/types
import std/core/undiv
import std/core/hnd
import std/core/exn
import std/core/char
import std/core/string
import std/core/int
import std/core/order


pub alias map<k,a> = tree<k,a>

pub fun get (m : map<k,a>, k: k, ?cmp: (k, k) -> order): maybe<a> 
  find(m, k)

pub fun add (m : map<k, a>, k : k, v : a, ?cmp: (k, k) -> order) : <exn|e> map<k,a>
  insert(m, k, v)

pub fun memcheck (m : map<k, a>, x : k, ?cmp: (k, k) -> order) : bool
  mem(m, x)

pub fun get_keys (m : map<k, a>) : list<k>
  match m 
    Leaf -> Nil
    Node(l, k, _, r) -> append(append(get_keys(l), Cons(k, Nil)), get_keys(r))

pub fun get_values (m : map<k, a>) : list<a>
  match m 
    Leaf -> Nil
    Node(l, _, v, r) -> append(append(get_values(l), Cons(v, Nil)), get_values(r))


// Show the key-value as a pair
pub fun show_key_value( k : k, v : a, ?show_key : k -> e string, ?show_value : a -> e string) : e string
  "(" ++ k.show_key ++ "," ++ v.show_value ++ ")"

// Show a map : in-order traversal
pub fun map/show( m : map<k,a>, ?show_key : k -> e string, ?show_value : a -> e string) : e string
  match m 
    Leaf -> ""
    Node(l, k, v, r) -> show(l) ++ show_key_value(k, v) ++ show(r) 
