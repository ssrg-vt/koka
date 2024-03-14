module div1

pub fun main() : exn int{
  val r = 2/0
  r
  //println("The result is " ++ r.show)
}

// new type : pos 
// x/y (x : int) (y : pos) : pos 
// x+y (x: pos) (y : pos) : pos
// x- y (x : pos) (y : pos) : int 
// fun div(x: int | x> 0, y : int | y >0) -> (z : int | z > 0)
// fun one() : pos
// fun make (x: int) : pos
// fun make (x : int) : <exn> pos 

