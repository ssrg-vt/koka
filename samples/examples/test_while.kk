fun while2(pred, action)  
  if pred() then
    action()
    while2(pred, action)

fun main()
  println("Hello while")