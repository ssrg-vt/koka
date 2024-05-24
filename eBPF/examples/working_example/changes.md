# List of changes:

- Remove/Simplify kklib 
- Remove all the supported datatypes in Koka as it hugely depends on kklib and add later after simplifying kklib 
- The argument to the eBPF function should be pointer to the specific structure:

   An ```xdp``` structure written in Koka:
   ```
   pub ref struct xdp_md 
    data : int32       
    data_end : int32  
    data_meta : int32 
   ```
   Generated C code by Koka compiler:
   ```
   struct kk_eBPF_bpflib_bpf__xdp__md_s {
    kk_block_t _block;
    };
   typedef kk_datatype_ptr_t kk_eBPF_bpflib_bpf__xdp__md;
   struct kk_eBPF_bpflib_bpf_Xdp__md {
    struct kk_eBPF_bpflib_bpf__xdp__md_s _base;
    int32_t data;
    int32_t data__end;
    int32_t data__meta;
   };
   ```
   - kk_datatype_ptr is a structure containing field of intptr_t 
   ```
    typedef struct kk_datatype_s {
        kk_intb_t dbox;
    } kk_datatype_t;
    typedef kk_datatype_t kk_datatype_ptr_t;
    typedef long int intptr_t;
   ```

    - An eBPF function that operates on these structure should always take an argument as a pointer to the specific structure instead of ```long int/kk_datatype_ptr_t```
    - The structure constains extra field _base that needs to be removed.
    - **Generated structure type in C accepted by BPF target**
      ```
      struct kk_eBPF_bpflib_bpf_Xdp__md {
        int32_t data;
        int32_t data__end;
        int32_t data__meta;
      };
      ```
      Any xdp eBPF program should take argument a pointer to the above structure. 

- Remove all automatically generated functions 
- Remove all functions that are used for drop/box/unbox etc. 
