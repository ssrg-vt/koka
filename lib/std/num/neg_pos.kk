module std/num/neg_pos

import std/core/types
import std/core/list
import std/num/pos

// Prints the binary representation of positive numbers as string
pub fun show_neg_pos (np : neg_pos) : e string 
  match np
    Pos(p) -> show_pos(p)
    Neg(p) -> "-" ++ show_pos(p)

// Opposite of a number 
pub fun neg_pos_opp (np : neg_pos) : neg_pos 
  match np 
    Pos(p) -> Neg(p)
    Neg(p) -> Pos(p)

// Convert neg_pos to int 
pub fun neg_pos_to_int (np : neg_pos) : int
  match np 
    Pos(p) -> pos_to_int(0,0,p)
    Neg(p) -> ~(pos_to_int(0,0,p))

pub fun extract_pos (np : neg_pos) : pos
  match np 
    Pos(p) -> p
    Neg(p) -> p

pub fun neg_pos_succ (np : neg_pos) : int 
  val n = neg_pos_to_int(np)
  n + 1

// Addition of two neg_pos numbers 
pub fun add_neg_pos (np1, np2 : neg_pos) : <div|_e> int 
  val i1 = neg_pos_to_int(np1)
  val i2 = neg_pos_to_int(np2)
  i1 + i2

// Substraction of two neg_pos numbers
pub fun sub_neg_pos (np1, np2 : neg_pos) : <div|_e> int
  val i1 = neg_pos_to_int(np1)
  val i2 = neg_pos_to_int(np2)
  i1 - i2

// Division where divisor can be positive or negative but not zero 
pub fun neg_pos_div (i : int,  np : neg_pos) : int 
  val i' = neg_pos_to_int(np)
  i / i'
  
pub fun main() 
 val n = Neg(XH)
 val n1 = Pos(XI(XH))
 val n2 = Pos(XO(XO(XH)))
 val n3 = Neg(XI(XH))
 val n4 = Pos(XO(XI(XH)))
 println("The negative number is " ++ n.show_neg_pos)
 println("The addition of " ++ n4.show_neg_pos ++ " and " ++ n3.show_neg_pos ++ " is " ++ add_neg_pos(n4, n3).show)
 println("The successor of " ++ n.show_neg_pos ++ " is " ++ neg_pos_succ(n).show)
 println("The subtraction of " ++ n.show_neg_pos ++ " and " ++ n4.show_neg_pos ++ " is " ++ sub_neg_pos(n, n4).show)


/* Rejected by the type-checker 
pub fun main ()
  val i1 = -2;
  val i2 = 0;
  val r = neg_pos_div (i1, i2)
  println("The result of diving " ++ i1.show ++ " and " ++ i2.show ++ " is" ++ r.show) */