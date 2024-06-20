module averageScore

import std/core/list
import std/num/float64

pub struct /*tattribute "aligned"*/ student 
  name : string
  score : int 

//pub type attribute "foo" bar

pub /*sec "foo" fattribute "noinline"*/ fun get_name (s : ref<h,student>) : <read<h>> int {
  val r1 = !s
  val r2 = r1.score
  return r2
}

fun sum_score (ss : list <student>) : int {
  match ss 
    Nil -> 0
    Cons(s, ss) -> s.score + sum_score(ss)
}

fun average_score (ss : list <student>) : float64 {
    val sum = sum_score(ss)
    val len = length(ss)
    (sum / len).float64
}

pub fun main() {
  val student1 = Student("Swarn", 50)
  val student2 = Student("Bash", 50)
  val student3 = Student("Khushboo", 30)
  val average = average_score(Cons(student1, Cons(student2, Cons(student3, Nil))))
  //val name = get_name(ref(student1))
  println("The sum of marks of all students is " ++ average.show)
}
