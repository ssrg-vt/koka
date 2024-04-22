-- https://elixir.bootlin.com/linux/v4.9/source/include/uapi/linux/bpf.h 
-- https://elixir.bootlin.com/linux/latest/source/kernel/bpf/helpers.c#L38

module Ebpf.Bpf 
   ( Xdp_action(..), 
     Bpf_cmd(..), 
     Bpf_arg_type(..), 
     Bpf_return_type(..), 
     Bpf_func_proto(..)
   ) where 

import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.List as List
import Data.Monoid
import Text.Printf

{- User return code for XDP prog type:
   A valid XDP program must return one of these valid field. 
   All other return codes are reserved for future use. 
   Unknown return codes will result in packet drops and a warning vid bpf_warn_invalid_xdp_action() -}

data Xdp_action = XDP_ABORTED | XDP_DROP | XDP_PASS | XDP_TX | XDP_REDIRECT
                  deriving (Eq, Ord)

data Bpf_cmd = BPF_MAP_CREATE | BPF_MAP_LOOKUP_ELEM | BPF_MAP_UPDATE_ELEM
             | BPF_MAP_DELETE_ELEM | BPF_GET_CURRENT_UID_GID | BPF_GET_CURRENT_PID_TGID 
             deriving (Eq, Ord)

data Bpf_arg_type =   ARG_DONTCARE                 -- unused argument in helper function 
                    | ARG_CONST_MAP_PTR            -- const argument used as pointer to bpf_map
                    | ARG_PTR_TO_MAP_KEY           -- pointer to stack used as map key 
                    | ARG_PTR_TO_MAP_VALUE         -- pointer to stack used as map value 
                                                   {- the following constraints used to prototype bpf_memcmp() and other
	                                                   functions that access data on eBPF program stack -}
                    | ARG_PTR_TO_STACK             -- any pointer to eBPF program stack 
                    | ARG_PTR_TO_RAW_STACK         {- any pointer to eBPF program stack, area does not
				                                          need to be initialized, helper function must fill
				                                          all bytes or clear them in error case. -}
                    | ARG_CONST_STACK_SIZE         -- number of bytes accessed from stack 
                    | ARG_CONST_STACK_SIZE_OR_ZERO -- number of bytes accessed from stack or 0 
                    | ARG_PTR_TO_CTX               -- pointer to context 
                    | ARG_ANYTHING                 -- any (initialized) argument is ok 
                    deriving (Eq, Ord)

-- type of values returned from helper functions 
data Bpf_return_type =   RET_INTEGER                   -- function returns integer
                       | RET_VOID                      -- function doesn't return anything 
                       | RET_PTR_TO_MAP_VALUE_OR_NULL  -- returns a pointer to map elem value or NULL 
                       deriving (Eq, Ord)


{- eBPF function prototype used by verifier to allow BPF_CALLs from eBPF programs
   to in-kernel helper functions and for adjusting imm32 field in BPF_CALL
   instructions after verifying -}

data Bpf_func_proto =  
   Bpf_func_proto { gpl_only :: Bool, 
                    pkt_access :: Bool, 
                    might_sleep :: Bool,
                    ret_type :: Bpf_return_type, 
                    arg1_type :: Bpf_arg_type,
                    arg2_type :: Bpf_arg_type,
                    arg3_type :: Bpf_arg_type,
                    arg4_type :: Bpf_arg_type,
                    arg5_type :: Bpf_arg_type }
                    deriving (Eq, Ord)


