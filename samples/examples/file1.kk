module file1

import std/os/path
import std/os/file

pub fun main()
  val input = "/Users/swarn/Desktop/VT_research/koka/samples/datatypes/file.txt".path
  val result = read-text-file(input)
  println("The file content is " ++ result.show)