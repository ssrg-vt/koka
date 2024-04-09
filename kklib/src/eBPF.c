// eBPF
/*
#include "kklib.h"
#include <string.h>
#include <stdio.h>
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h> */

/*kk_unit_t kk_bpf_println(kk_string_t s, kk_context_t* ctx) {
  // TODO: set locale to utf-8?
  // puts(kk_string_cbuf_borrow(s, NULL, ctx));  // todo: allow printing embedded 0 characters?
  // bpf_printk(s);
  FILE * fp; 
  fp = open ("/sys/kernel/debug/tracing/tracepipe", "a+");
  if (fp) {
    fprintf(fp, kk_string_cbuf_borrow(s, NULL, ctx)); // prints in the "/sys/kernel/debug/tracing/tacepipe" 
    printf("I was able to open the tracepipe\n");
  } {
    printf("I was not able to write to tracepipe\n");
  }
  
  kk_string_drop(s, ctx);
  return kk_Unit;
}*/


// eBPF
/*
kk_unit_t kk_bpf_println(kk_string_t s, kk_context_t* ctx) {
  char ____fmt[] = "Hello from koka";
  bpf_trace_printk(____fmt, sizeof(____fmt));
  kk_string_drop(s, ctx);
  return kk_Unit;
}*/