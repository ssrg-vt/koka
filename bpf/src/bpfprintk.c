kk_unit_t kk_printf_int32(int32_t i) {
    bpf_printk("%"PRId32"\n", i);
    return kk_Unit;
}

kk_unit_t kk_printf_int64(int64_t i) {
    bpf_printk("%"PRId64"\n", i);
    return kk_Unit;
}
