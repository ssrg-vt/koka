module list_effect_handlers

effect yield
  ctl yield( i : int ) : bool

fun traverse( xs : list<int> ) : yield () 
  match xs 
    Cons(x,xx) -> if yield(x) then traverse(xx) else ()
    Nil        -> ()

fun print-elems() : console () 
  with ctl yield(i)
    println("yielded " ++ i.show)
    resume(i<=2)
  traverse([1,2,3,4])

pub fun main()
  print-elems()