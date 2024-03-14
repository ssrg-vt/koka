module std/num/pos

import std/core/types
import std/core/list

// Prints the binary representation of positive numbers as string
pub fun show_pos (p : pos) : e string 
  match p  
    XH -> "1"
    XO(p) -> "0" ++ "" ++ show_pos(p)
    XI(p) -> "1" ++ "" ++ show_pos(p)

// Successor of a positive number 
pub fun succ (p : pos) : pos 
  match p 
    XH -> XO(XH)
    XO(p) -> XI(p)
    XI(p) -> XO(succ(p))

// Addition of two positive numbers 
pub fun add_pos (p1, p2 : pos) : <div|_e> pos 
  match p1 
    XH -> match p2 
            XH -> XO(XH)
            XO(p) -> XI(p)
            XI(p) -> XO(succ(p))
    XO(p) -> match p2 
              XH -> XI(p)
              XO(q) -> XO(add_pos(p,q))
              XI(q) -> XI(add_pos(p,q))
    XI(p) -> match p2 
              XH -> XO(succ(p))
              XO(q) -> XI(add_pos(p,q))
              XI(q) -> XO(add_pos(XH,(add_pos(p,q))))


// Convert positive to integer 
pub fun pos_to_int (i : int, acc: int, p : pos) : int 
  match p 
    XH -> pow(2, i) + acc
    XO(p) -> pos_to_int(i + 1, acc, p)
    XI(p) -> pos_to_int(i + 1, acc + pow(2, i), p)

// Substraction of two positive numbers 
pub fun sub_pos (p1, p2 : pos) : int 
  (pos_to_int(0, 0, p1) - pos_to_int(0, 0, p2))

// Convert int to pos : raises an exception 
pub fun int_to_pos (i : int) : <div,exn|e> pos 
  if i <= 0 
  then throw("Not a positive number") 
  else if (i == 1) then XH else succ(int_to_pos(i - 1))

pub fun pos_div (x : int, y : pos) : int 
  val yi = pos_to_int(0, 0, y)  
  val r = x / yi 
  r

pub fun main() 
  val p = XO(XI(XH))
  val r = succ(p)
  val p1 = XO(XI(XH))
  val p2 = (XI(XH))
  val rs = add_pos(p1, p2)
  val sub = sub_pos(p1, p2)
  println("The successor of " ++ p.show_pos ++ " is " ++ r.show_pos)
  println("The addition of " ++ p1.show_pos ++ " and " ++ p2.show_pos ++ " is " ++ rs.show_pos)
  println("The integer representation of " ++ p.show_pos ++ " is " ++ (pos_to_int(0, 0, p)).show)
  println("The substraction of " ++ p1.show_pos ++ " and " ++ p2.show_pos ++ " is " ++ sub.show)
  println("The pos of int " ++ int_to_pos(4).show_pos)

pub fun main ()
  val i1 = 2;
  val i2 = 0;
  val r = pos_div (i1, i2)
  println("The result of diving " ++ i1.show ++ " and " ++ i2.show ++ " is" ++ r.show)




