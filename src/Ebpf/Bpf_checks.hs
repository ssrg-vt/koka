module Ebpf.Bpf_checks ( 
   BpfProtoMap(..), 
   lookupBpfProtoMap,
   check_bpf_map_lookup_elem_proto,
   check_bpf_map_update_elem_proto,
   check_bpf_map_delete_elem_proto,
   check_bpf_get_current_uid_gid_proto,
   check_bpf_get_current_pid_tgid_proto

) where

import Ebpf.Bpf 
import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.List as List
import Data.Monoid
import Text.Printf

type BpfProtoMap = Map.Map Bpf_cmd Bpf_func_proto
lookupBpfProtoMap :: Bpf_cmd -> BpfProtoMap -> Maybe Bpf_func_proto
lookupBpfProtoMap = Map.lookup


{- If Kernel subsytem is allowing eBPF programs to call these helper functions, then the 
   we need to perform the static analysis:
   Traverse(P) -> list of helper functions (suppose hfs)
   Apply (check) (hfs) should return true, which would mean that each element in hfs satisfies its corresponding proto -}

-- Returns the pointer to the value or null
-- Takes 2 arguments 
      -- pointer to the map 
      -- pointer to the key used for lookup
check_bpf_map_lookup_elem_proto :: BpfProtoMap -> Bpf_cmd -> Bool 
check_bpf_map_lookup_elem_proto bm bc =
   case bc of 
      BPF_MAP_LOOKUP_ELEM -> let r = lookupBpfProtoMap bc bm in 
                             case r of
                              Nothing -> False 
                              Just a -> if ((gpl_only(a) == False) && 
                                            (pkt_access(a) == True) && 
                                            (ret_type(a) == RET_PTR_TO_MAP_VALUE_OR_NULL) && 
                                            (arg1_type(a) == ARG_CONST_MAP_PTR) && 
                                            (arg2_type(a) == ARG_PTR_TO_MAP_KEY)) 
                                        then True 
                                        else False
      _ -> False 

-- Returns integer
-- Takes 4 arguments 
      -- Pointer to the map
      -- Pointer to the key whose value will be updated
      -- Poitner to the new value 
      -- Flags (??)
check_bpf_map_update_elem_proto :: BpfProtoMap -> Bpf_cmd -> Bool 
check_bpf_map_update_elem_proto bm bc =
   case bc of 
      BPF_MAP_UPDATE_ELEM -> let r = lookupBpfProtoMap bc bm in 
                             case r of
                              Nothing -> False 
                              Just a -> if ((gpl_only(a) == False) && 
                                            (pkt_access(a) == True) && 
                                            (ret_type(a) == RET_INTEGER) && 
                                            (arg1_type(a) == ARG_CONST_MAP_PTR) && 
                                            (arg2_type(a) == ARG_PTR_TO_MAP_KEY) &&
                                            (arg3_type(a) == ARG_PTR_TO_MAP_VALUE) &&
                                            (arg4_type(a) == ARG_ANYTHING)) 
                                        then True 
                                        else False
      _ -> False 

-- Return type is integer
-- Takes 2 arguments
      -- Pointer to map 
      -- Pointer to key
check_bpf_map_delete_elem_proto :: BpfProtoMap -> Bpf_cmd -> Bool 
check_bpf_map_delete_elem_proto bm bc =
   case bc of 
      BPF_MAP_DELETE_ELEM -> let r = lookupBpfProtoMap bc bm in 
                             case r of
                              Nothing -> False 
                              Just a -> if ((gpl_only(a) == False) && 
                                            (pkt_access(a) == True) && 
                                            (ret_type(a) == RET_INTEGER) && 
                                            (arg1_type(a) == ARG_CONST_MAP_PTR) && 
                                            (arg2_type(a) == ARG_PTR_TO_MAP_KEY) )
                                        then True 
                                        else False
      _ -> False 

-- Return type is integer
check_bpf_get_current_uid_gid_proto :: BpfProtoMap -> Bpf_cmd -> Bool 
check_bpf_get_current_uid_gid_proto bm bc =
   case bc of 
      BPF_GET_CURRENT_UID_GID -> let r = lookupBpfProtoMap bc bm in 
                             case r of
                              Nothing -> False 
                              Just a -> if ((gpl_only(a) == False) &&
                                            (ret_type(a) == RET_INTEGER) )
                                        then True 
                                        else False
      _ -> False 

-- Return type is integer
check_bpf_get_current_pid_tgid_proto :: BpfProtoMap -> Bpf_cmd -> Bool 
check_bpf_get_current_pid_tgid_proto bm bc =
   case bc of 
      BPF_GET_CURRENT_PID_TGID -> let r = lookupBpfProtoMap bc bm in 
                             case r of
                              Nothing -> False 
                              Just a -> if ((gpl_only(a) == False) &&
                                            (ret_type(a) == RET_INTEGER) )
                                        then True 
                                        else False
      _ -> False 


