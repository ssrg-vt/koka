/* AVL tree

   This module implements AVL tree: self balancing binary tree
   In AVL tree, the height of two child subtree of any node differ by at most one; if anytime
   they differ by more than one 
*/

module std/data/avl

import std/os/env
import std/core/types
import std/core/undiv
import std/core/hnd
import std/core/exn
import std/core/char
import std/core/string
import std/core/int

// A tree with `:k` keys and values `:a` in each node and last field representing the height of the tree
pub type tree<k,a>
  Leaf
  Node(left : tree<k,a>, k: k, value : a, right : tree<k,a>, height: int)

// Gives the height of the tree 
pub fun height (m : tree<k,a>) : int 
  match m 
    Leaf -> 0
    Node(_, _, _, _, h) -> h

pub fun is_empty (m : tree<k, a>) : bool
  match m 
    Leaf -> True
    Node(_, _, _, _, _) -> False

pub fun mem (m : tree<k,a>, x : k, ?cmp : (k, k) -> order): bool 
  match m 
    Leaf -> False
    Node(l, k, _, r, _) 
      -> if (x < k) then mem(l, x)
         elif (x == k) then True 
         else mem(r, x)

pub fun find (m : tree<k,a>, x : k, ?cmp: (k, k) -> order) : maybe<a>
  match m 
    Leaf -> Nothing
    Node(l, k, v, r, _) -> 
      if (x < k) then find(l, x)
      elif (x == k) then Just(v)
      else find(r, x)

pub fun create (lm : tree<k,a>, x : k, v : a, rm : tree<k, a>) : tree <k,a>
  Node(lm, x, v, rm, (max(height(lm), height(rm)) + 1))

pub fun rotl (m : tree<k,a>) : <exn|e> tree<k,a> 
  match m 
    Node(lm, k, v, Node(lm', k', v', rm', _), _) 
      -> create (create(lm, k, v, lm'), k', v', rm')
    _ -> throw("left rotation is not possible")

pub fun rotr (m : tree<k,a>) : <exn|e> tree<k,a>
  match m 
    Node(Node(lm, kl, vl, rm), k, v, rm', _)
      -> create(lm, kl, vl, create(rm, k, v, rm'))
    _ -> throw("right rotation is not possible")


pub fun insert (m : tree<k,a>, x : k, v : a, ?cmp: (k, k) -> order) : <exn|e> tree<k,a> 
  match m
    Leaf -> Node(Leaf, x, v, Leaf, 1)
    Node(l, k, d, r, h) -> 
      if (x == k) then Node(l, k, v, r, h)
      elif (x < k) then match insert(l, x, v) 
                          Leaf -> throw("Not possible")
                          Node(tl, kl, dl, rl, hl) -> 
                            if (hl - height(r)) <= 1 
                            then create(Node (tl, kl, dl, rl, hl), k, d, r)
                            else if (height(tl) < height(rl))
                                 then rotr(create (rotl (Node (tl, kl, dl, rl, hl)), k, d, r))
                                 else rotr(create ((Node (tl, kl, dl, rl, hl)), k, d, r))
      else match insert(r, x, v) 
            Leaf -> throw("Not possible")
            Node(tr, kr, dr, rr, hr) -> 
              if (hr - height(l)) <= 1 
              then create(l, k, d, Node (tr, kr, dr, rr, hr))
              else if (height(tr) > height(rr))
                   then rotl(create (l, k, d, rotr (Node(tr, kr, dr, rr, hr))))
                   else rotl(create (l, k, d, (Node(tr, kr, dr, rr, hr))))


pub fun check_balanced (m : tree<k, a>) : bool 
  match m 
    Leaf -> True 
    Node (l, _, _, r, h) -> if (h == (max(height(l), height(r)) + 1))
                            then check_balanced(l) && check_balanced(r)
                            else False








