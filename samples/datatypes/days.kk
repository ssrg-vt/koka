module days

type day
  con Monday
  con Tuesday
  con Wednesday
  con Thursday
  con Friday
  con Saturday
  con Sunday

fun next_day(d : day) : day {
  match d 
    Monday -> Tuesday
    Tuesday -> Wednesday
    Wednesday -> Thursday 
    Thursday -> Friday
    Friday -> Saturday
    Saturday -> Sunday 
    Sunday -> Monday
}

pub fun day_show( d : day ) : string
  match d 
    Monday -> "Monday"
    Tuesday -> "Tuesday"
    Wednesday -> "Wednesday"
    Thursday -> "Thursday"
    Friday -> "Friday"
    Saturday -> "Saturday"
    Sunday -> "Sunday"

pub fun main() {
  val d = Monday
  println("The next day is " ++ next_day(d).day_show)
}