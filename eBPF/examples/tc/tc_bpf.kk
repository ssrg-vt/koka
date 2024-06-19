// SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
/* Copyright (c) 2022 Hengqi Chen */
/*#include <vmlinux.h>
#include <bpf/bpf_endian.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

#define TC_ACT_OK 0
#define ETH_P_IP  0x0800 /* Internet Protocol packet	*/

SEC("tc")
int tc_ingress(struct __sk_buff *ctx)
{
	void *data_end = (void *)(__u64)ctx->data_end;
	void *data = (void *)(__u64)ctx->data;
	struct ethhdr *l2;
	struct iphdr *l3;

	if (ctx->protocol != bpf_htons(ETH_P_IP))
		return TC_ACT_OK;

	l2 = data;
	if ((void *)(l2 + 1) > data_end)
		return TC_ACT_OK;

	l3 = (struct iphdr *)(l2 + 1);
	if ((void *)(l3 + 1) > data_end)
		return TC_ACT_OK;

	bpf_printk("Got IP packet: tot_len: %d, ttl: %d", bpf_ntohs(l3->tot_len), l3->ttl);
	return TC_ACT_OK;
}

char __license[] SEC("license") = "GPL"; */

import eBPF/bpflib/bpf_helpers
import eBPF/bpflib/bpf
import std/num/int32
import std/num/int64
import std/core/console

val tc_act_ok = 0
val eth_p_ip =  0x0800 /* Internet Protocol packet	*/

pub sec "tc" fun tc_ingress (skctx : sk_buff) {
  val data_end = (skctx.data_end).int64 
  val data = (skctx.data).int64 
  return 0
}