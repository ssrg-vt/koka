/*
Focus points:
  - helper function argument: pointer to buffer
  - switch statements
*/

/*
https://docs.ebpf.io/linux/program-type/BPF_PROG_TYPE_NETFILTER/

// SPDX-License-Identifier: GPL-2.0-only
#include "vmlinux.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>
#include "bpf_tracing_net.h"

#define NF_DROP         0
#define NF_ACCEPT       1
#define ETH_P_IP        0x0800
#define ETH_P_IPV6      0x86DD
#define IP_MF           0x2000
#define IP_OFFSET       0x1FFF
#define NEXTHDR_FRAGMENT    44

extern int bpf_dynptr_from_skb(struct __sk_buff *skb, __u64 flags, struct bpf_dynptr *ptr__uninit) __ksym;
extern void *bpf_dynptr_slice(const struct bpf_dynptr *ptr, uint32_t offset, void *buffer, uint32_t buffer__sz) __ksym;

volatile int shootdowns = 0;

static bool is_frag_v4(struct iphdr *iph)
{
    int offset;
    int flags;

    offset = bpf_ntohs(iph->frag_off);
    flags = offset & ~IP_OFFSET;
    offset &= IP_OFFSET;
    offset <<= 3;

    return (flags & IP_MF) || offset;
}

static bool is_frag_v6(struct ipv6hdr *ip6h)
{
    /* Simplifying assumption that there are no extension headers
     * between fixed header and fragmentation header. This assumption
     * is only valid in this test case. It saves us the hassle of
     * searching all potential extension headers.
     */
    return ip6h->nexthdr == NEXTHDR_FRAGMENT;
}

static int handle_v4(struct __sk_buff *skb)
{
    struct bpf_dynptr ptr;
    u8 iph_buf[20] = {};
    struct iphdr *iph;

    if (bpf_dynptr_from_skb(skb, 0, &ptr))
        return NF_DROP;

    iph = bpf_dynptr_slice(&ptr, 0, iph_buf, sizeof(iph_buf));
    if (!iph)
        return NF_DROP;

    /* Shootdown any frags */
    if (is_frag_v4(iph)) {
        shootdowns++;
        return NF_DROP;
    }

    return NF_ACCEPT;
}

static int handle_v6(struct __sk_buff *skb)
{
    struct bpf_dynptr ptr;
    struct ipv6hdr *ip6h;
    u8 ip6h_buf[40] = {};

    if (bpf_dynptr_from_skb(skb, 0, &ptr))
        return NF_DROP;

    ip6h = bpf_dynptr_slice(&ptr, 0, ip6h_buf, sizeof(ip6h_buf));
    if (!ip6h)
        return NF_DROP;

    /* Shootdown any frags */
    if (is_frag_v6(ip6h)) {
        shootdowns++;
        return NF_DROP;
    }

    return NF_ACCEPT;
}

SEC("netfilter")
int defrag(struct bpf_nf_ctx *ctx)
{
    struct __sk_buff *skb = (struct __sk_buff *)ctx->skb;

    switch (bpf_ntohs(ctx->skb->protocol)) {
    case ETH_P_IP:
        return handle_v4(skb);
    case ETH_P_IPV6:
        return handle_v6(skb);
    default:
        return NF_ACCEPT;
    }
}

char _license[] SEC("license") = "GPL";
*/

import bpf/bpflib/bpf
import bpf/bpflib/bpf_helpers
import bpf/bpflib/bpf_endian
import std/num/int32

// Constants
val NF_DROP = 0
val NF_ACCEPT = 1
val ETH_P_IP = 0x0800
val ETH_P_IPV6 = 0x86DD
val IP_MF = 0x2000
val IP_OFFSET = 0x1FFF
val NEXTHDR_FRAGMENT = 44

// External functions (these would need to be properly implemented or imported)
extern fun bpf_dynptr_from_skb(skb : __sk_buff, flags : int64, ptr : bpf_dynptr) : int
extern fun bpf_dynptr_slice(ptr : bpf_dynptr, offset : uint32, buffer : vector<uint8>, buffer_sz : uint32) : maybe<vector<uint8>>

// Global variable (illegal)
var shootdowns := 0

// Helper functions
fun is_frag_v4(iph : iphdr) : bool {
  val offset = bpf_ntohs(iph.frag_off)
  val flags = offset.and(int32.not(IP_OFFSET))
  val offset = (offset.and(IP_OFFSET)).shl(3)
  
  (flags.and(IP_MF) != 0) || (offset != 0)
}

fun is_frag_v6(ip6h : ipv6hdr) : bool {
  ip6h.nexthdr == NEXTHDR_FRAGMENT
}

fun handle_v4(skb : __sk_buff) : int {
  var ptr : bpf_dynptr
  // koka does not have a vector or array
  var iph_buf := vector<uint8>(20, 0)
  
  if bpf_dynptr_from_skb(skb, 0, ptr) != 0 then
    return NF_DROP
  
  match bpf_dynptr_slice(ptr, 0, iph_buf, 20)
    Nothing -> NF_DROP
    Just(iph) ->
      if is_frag_v4(iph.as-iphdr) then
        shootdowns := shootdowns + 1
        NF_DROP
      else
        NF_ACCEPT
}

fun handle_v6(skb : __sk_buff) : int {
  var ptr : bpf_dynptr
  // koka does not have a vector or array
  var ip6h_buf := vector<uint8>(40, 0)
  
  if bpf_dynptr_from_skb(skb, 0, ptr) != 0 then
    return NF_DROP
  
  match bpf_dynptr_slice(ptr, 0, ip6h_buf, 40)
    Nothing -> NF_DROP
    Just(ip6h) ->
      if is_frag_v6(ip6h.as-ipv6hdr) then
        shootdowns := shootdowns + 1
        NF_DROP
      else
        NF_ACCEPT
}

pub sec "netfilter" fun defrag(ctx : ref<bpf_nf_ctx>) : int {
  val skb = ctx.skb.as-__sk_buff
  
  match bpf_ntohs(skb.protocol)
    ETH_P_IP -> handle_v4(skb)
    ETH_P_IPV6 -> handle_v6(skb)
    _ -> NF_ACCEPT
}

val license sec "license" = "GPL"
