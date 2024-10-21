Examples were provided by shenghaoyuan and pulled from https://github.com/shenghaoyuan/bcc/tree/master/verifier_log_test. Kernel version used for testing: 5.14.0

`array_test.bpf.c`: No verifier issue

`fib_test.bpf.c (version = 1)`: Does not load because "bad call relo against 'fibonacci' in section 'kprobe/sys_execve'" which is an error thrown by libbpf

`fib_test.bpf.c (version = 2)`: 

```
libbpf: prog 'fibonacci': BPF program load failed: Permission denied
libbpf: prog 'fibonacci': -- BEGIN PROG LOAD LOG --
R1 is not a scalar
0: R1=ctx(off=0,imm=0) R10=fp0
; int fibonacci(int n) {
0: (bf) r2 = r1                       ; R1=ctx(off=0,imm=0) R2_w=ctx(off=0,imm=0)
1: (67) r2 <<= 32
R2 pointer arithmetic with <<= operator prohibited
processed 2 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
-- END PROG LOAD LOG --
libbpf: prog 'fibonacci': failed to load: -13
libbpf: failed to load object 'fib_test.bpf.o'
Error: failed to load object file
```

`fib_test.bpf.c (version = 3)`: Rejected because program is too large

`fib_test.bpf.c (version = 4)`: No verifier issue

`fletcher32_test.bpf.c`: Rejected because "R1 invalid mem access 'scalar'"

It doesn't like the *data++ dereference
