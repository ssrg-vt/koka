module map1

import std/data/avl
import std/data/map

pub fun main () {
  val m = create(Node(Leaf, 1, 4, Leaf, 1), 2, 2, Node(Leaf, 3, 6, Leaf, 1))
  val key = 3
  val result1 = get(m, key)
  val result2 = mem(m, 1)
  val result3 = get_keys(m)
  val result4 = get_values(m)
  val result5 = insert(m, -1, -1)
  val result6 = insert(result5, -2, -2)
  val result7 = insert(result6, -3, -3)
  println("The value is " ++ result1.show)
  println("The result of existence of key " ++ key.show ++ " is " ++ result2.show)
  println("The list of keys are " ++ result3.show)
  println("The list of values are " ++ result4.show)
  println("The map looks like " ++ map/show(m, int/show, int/show))
  println("The map looks like " ++ map/show(result5, int/show, int/show))
  println("The map looks like " ++ map/show(result6, int/show, int/show))
  println("The map looks like " ++ map/show(result7, int/show, int/show))
}
  
