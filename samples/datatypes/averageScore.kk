module averageScore

import std/core/list
import std/num/float64

struct student 
  name : string
  score : int 

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
  println("The sum of marks of all students is " ++ average.show)
}