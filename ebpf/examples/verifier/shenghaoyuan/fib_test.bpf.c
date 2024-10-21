#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

#define version 1

#if version == 1
SEC("kprobe/sys_execve")
int fibonacci(int n) {
    if(n == 0) {
        return 0;
    } else if(n == 1) {
        return 1;
    } else {
        return fibonacci(n-1) + fibonacci(n-2);
    }
}
#elif version == 2
SEC("kprobe/sys_execve")
int fibonacci(int n) {
    if(n <= 1) {
        return n;
    }
    int a = 0, b = 1;
    for(int i = 2; i <= n; i++) {
        int temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}
#elif version == 3
SEC("kprobe/sys_execve")
unsigned int fibonacci(unsigned int* n) {
    if(*n <= 1) {
        return *n;
    }
    unsigned int a = 0, b = 1;
    for(int i = 2; i <= *n; i++) {
        int temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}
#elif version == 4
SEC("kprobe/sys_execve")
unsigned int fibonacci(void * ctx) {
    unsigned int a = 0, b = 1;
    for(int i = 2; i <= 3; i++) {
        int temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}
#endif

char LICENSE[] SEC("license") = "GPL";
