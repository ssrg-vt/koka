module list_map

fun foo() {
  val xs = list(1, 1000)
  val ys = map (xs, inc)
  print ys
}

