module eBPF/bpflib/bpf_helpers

import std/os/path
import std/os/file 
import std/core/console

/*
pub fun bpf_printk_koka (s : string) : io () { 
 val fs = "/sys/kernel/debug/tracing/trace_pipe".path 
 write-text-file( fs, s)
}


pub fun main () : io () {
 val s = "Hello world"
 bpf_printk_koka(s)
}

// uncaught exception: unable to write text file "/sys/kernel/debug/tracing/trace_pipe": Device or resource busy

*/

