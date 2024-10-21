#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

#define version 1

#if version == 1
SEC("kprobe/sys_execve")
int hello1(void *ctx) {
  unsigned x = 1;
  x *= 3;
  return x;
}
#elif version == 2
SEC("kprobe/sys_execve")
int hello1(unsigned x) {
  x *= 3;
  return x;
}
#elif version == 3
SEC("kprobe/sys_execve")
int hello1(unsigned* x) {
  *x *= 3;
  return *x;
}
#elif version == 4
SEC("kprobe/sys_execve")
unsigned hello1(unsigned* x) {
  unsigned y = 1;
  y += (*x) * 3;
  return y;
}
#endif

char LICENSE[] SEC("license") = "GPL";
