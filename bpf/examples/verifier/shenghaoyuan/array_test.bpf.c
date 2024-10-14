#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

SEC("kprobe/sys_execve")
unsigned array_sum(void* ctx) {
  unsigned a [10] = {0}, sum = 0;
  for (int i = 0; i < 10; i++){
    a[i] = 100+i*10;
  }
  
  for (int j = 9; j >= 0; j--){
    sum += a[j];
  }
  return sum;
}

char LICENSE[] SEC("license") = "GPL";
