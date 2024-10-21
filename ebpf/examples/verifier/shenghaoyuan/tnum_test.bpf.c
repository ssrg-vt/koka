#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

#define version 1

#if version == 1
SEC("kprobe/sys_execve")
unsigned tnum_test(unsigned* x) {
  unsigned int y = 0b01100;
  // unsigned int z = 0b110011;
  y = (*x) & y;
  // z = y | z;
  return y;
}
#elif version == 2
SEC("kprobe/sys_execve")
unsigned int tnum_test(unsigned int * x) {
  unsigned int y = (*x) >> 24, z, f;
  z = y | 0x40;
  f = z + 1;
  return f;
}
#elif version == 3
SEC("kprobe/sys_execve")
unsigned int tnum_test(unsigned int * x) {
  unsigned int y = (*x) >> 24, z;
  z = y | 0x40;
  return z;
}
#endif

char LICENSE[] SEC("license") = "GPL";
