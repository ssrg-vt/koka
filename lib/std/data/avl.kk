/* AVL tree

   This module implements AVL tree: self balancing binary tree
   In AVL tree, the height of two child subtree of any node differ by at most one; if anytime
   they differ by more than one 
*/

module avl

import std/os/env
import std/core/types
import std/core/types
import std/core/undiv
import std/core/hnd
import std/core/exn
import std/core/char
import std/core/string
import std/core/int

// A tree with `:k` keys and values `:a` in each node and last field representing the height of the tree
type tree<k,a>
  Leaf
  Node(left : tree<k,a>, k: k, value : a, right : tree<k,a>, height: int)

// Gives the height of the tree 
fun height (m : tree<k,a>) : int 
  match m 
    Leaf -> 0
    Node(_, _, _, _, h) -> h

fun is_empty (m : tree<k, a>) : bool
  match m 
    Leaf -> True
    Node(_, _, _, _, _) -> False

fun mem (m : tree<k,a>, x : k, ?cmp : (k, k) -> order): bool 
  match m 
    Leaf -> False
    Node(l, k, _, r, _) 
      -> if (x < k) then mem(l, x)
         elif (x == k) then True 
         else mem(r, x)

fun find (m : tree<k,a>, x : k, ?cmp: (k, k) -> order) : maybe<a>
  match m 
    Leaf -> Nothing
    Node(l, k, v, r, _) -> 
      if (x < k) then find(l, x)
      elif (x == k) then Just(v)
      else find(r, x)

fun create (lm : tree<k,a>, x : k, v : a, rm : tree<k, a>) : tree <k,a>
  Node(lm, x, v, rm, (max(height(lm), height(rm)) + 1))

fun rotl (m : tree<k,a>) : <exn|e> tree<k,a> 
  match m 
    Node(lm, k, v, Node(lm', k', v', rm', _), _) 
      -> create (create(lm, k, v, lm'), k', v', rm')
    _ -> throw("left rotation is not possible")


fun rotr (m : tree<k,a>) : <exn|e> tree<k,a>
  match m 
    Node(Node(lm, kl, vl, rm), k, v, rm', _)
      -> create(lm, kl, vl, create(rm, k, v, rm'))
    _ -> throw("right rotation is not possible")

pub fun main () {
  //val tr = Node((Node(Leaf, 1, 4, Leaf, 1)), 2, 2, (Node(Leaf, 3, 6, Leaf, 1)), 2)
  val tr = create(Node(Leaf, 1, 4, Leaf, 1), 2, 2, Node(Leaf, 3, 6, Leaf, 1))
  val h = height(tr)
  val key = 3
  val result = find(tr, key)
  println("The membership result is " ++ result.show)
  println("The height is " ++ h.show)
}





