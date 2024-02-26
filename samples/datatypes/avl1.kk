module avl1

import std/data/avl

pub fun main () {
  //val tr = Node((Node(Leaf, 1, 4, Leaf, 1)), 2, 2, (Node(Leaf, 3, 6, Leaf, 1)), 2)
  val tr = create(Node(Leaf, 1, 4, Leaf, 1), 2, 2, Node(Leaf, 3, 6, Leaf, 1))
  val h = height(tr)
  val key = 3
  val result = find(tr, key)
  println("The membership result is " ++ result.show)
  println("The height is " ++ h.show)
}