#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <stdint.h>

struct fletcher32_ctx {
  const unsigned short * data;
  uint32_t words;
};

SEC("kprobe/sys_execve")
uint32_t fletcher32(struct fletcher32_ctx *ctx)
{
    uint32_t sum1 = 0xffff, sum2 = 0xffff, sumt = 0xffff, words = (*ctx).words;
    const uint16_t *data = (*ctx).data;

    while (words) {
        // if words is greater then 359 set tlen to 359 else set tlen to words
        unsigned tlen = words > 359 ? 359 : words;
        words -= tlen;
        do {
            sumt = sum1;
            sum2 += sum1 += *data++; // problematic line
        } while (--tlen);
        sum1 = (sum1 & 0xffff) + (sum1 >> 16);
        sum2 = (sum2 & 0xffff) + (sum2 >> 16);
    }
    sum1 = (sum1 & 0xffff) + (sum1 >> 16);
    sum2 = (sum2 & 0xffff) + (sum2 >> 16);
    return (sum2 << 16) | sum1;
}

char LICENSE[] SEC("license") = "GPL";
