module safe_div1

effect ctl raise(s : string ) : a

fun safe-div(x,y)
  if y==0 then raise("division by zero") else x / y


fun rcatch(action,h)
  with ctl raise(s) h(s)   // handle `raise` with function `h`
  action()                     // in `action()`


fun zerodiv(x,y)
  rcatch( fn() safe-div(x,y), fn(s) 0 )

pub fun main()
  zerodiv(2, 0) 

/* fun foo (x : int) : int 
  val r = x + 1
  r

pub fun main()
  foo("foo") */
/* effect ctl raise(s : string ) : a

effect yield 
  ctl yield (i : int) : exn bool

// The ensure-nonzero calls yield on x, hence it gets the yield effect as output type
fun ensure_nonzero(x) : yield ()
  if (yield(x)) then () else throw("Division by zero")

*/