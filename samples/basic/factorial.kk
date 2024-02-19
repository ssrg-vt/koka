// Factorial of a number.
module factorial

pub fun main() 
  val n = 5
  println("The factorial of " ++ n.show ++ " is " ++ fact(n).show)

fun fact(n : int) : div int 
  if n<=0 then 1 else n * fact(n - 1)

