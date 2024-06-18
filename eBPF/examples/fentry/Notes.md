# Fentry and Fexit 
- Fentry (function entry) and Fexit (function exit) are two types of probes in eBPF used for tracing at the 
  entry and exit points of Linux kernel functions.
- They allow developers to collect information, modify parameters, or observe return values at 
  specific stages of kernel function execution. 
- In this example, we can directly access the pointers to the functions' parameters, just like in regular C code, 
  without needing various read helpers. 
- The main difference between fexit and kretprobe programs is that fexit programs can access both the input parameters and return values of a
  function, while kretprobe programs can only access the return value.

## Program description:
- An fentry probe named BPF_PROG(do_unlinkat) that is triggered at the entry point of the do_unlinkat function. This probe retrieves the PID (Process ID) of the current process and prints it along with the filename to the kernel log.
- An fexit probe named BPF_PROG(do_unlinkat_exit) that is triggered at the exit point of the do_unlinkat function. Similar to the fentry probe, this probe also retrieves the PID of the current process and prints it along with the filename and return value to the kernel log.
- This program is an eBPF program that captures the do_unlinkat and do_unlinkat_exit functions using fentry and fexit, and uses bpf_get_current_pid_tgid and bpf_printk functions to obtain the ID, filename, and return value of the process calling do_unlinkat, and print them in the kernel log.