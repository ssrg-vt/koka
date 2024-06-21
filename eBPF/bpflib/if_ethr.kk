module eBPF/bpflib/if_ethr

import std/num/int32
import std/num/int64 

// https://github.com/torvalds/linux/blob/master/include/uapi/linux/if_ether.h

pub val eth_alen = 6                    // /* Octets in one ethernet addr	 */
pub val eth_tlen = 2                    // /* Octets in ethernet type field */
pub val eth_hlen = 14                   // /* Total octets in header.	 */
pub val eth_zlen = 60                   // /* Min. octets in frame sans FCS */
pub val eth_data_len = 1500             // /* Max. octets in payload	 */
pub val eth_frame_len = 1514            // /* Max. octets in frame sans FCS */
pub val eth_fcs_len = 4                 // /* Octets in the FCS		 */

pub val eth_min_mtu = 68                // /* Min IPv4 MTU per RFC791	*/

//#define ETH_MAX_MTU	0xFFFFU		/* 65535, same as IP_MAX_MTU	*/
pub val eth_max_mtu = 0xFFF           // 65535, same as IP_MAX_MTU	*/

/*
 *	These are the defined Ethernet Protocol ID's.
 */
pub val eth_p_loop = 0x0060           // /* Ethernet Loopback packet	*/
pub val eth_p_pup = 0x0200            // 	/* Xerox PUP packet		*/
pub val eth_p_pupat = 0x0201          // /* Xerox PUP Addr Trans packet	*/
pub val eth_p_tsn = 0x22F0            // /* TSN (IEEE 1722) packet	*/
pub val eth_p_erspan2 = 0x22EB        // /* ERSPAN version 2 (type III)	*/
pub val eth_p_ip = 0x800              // /* Internet Protocol packet	*/
pub val eth_p_x25 = 0x0805            // /* CCITT X.25			*/
pub val eth_p_arp = 0x0806            // /* Address Resolution packet	*/
pub val eth_p_bpq = 0x08FF            // /* G8BPQ AX.25 Ethernet Packet	[ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_ieeepup = 0x0a00        // /* Xerox IEEE802.3 PUP packet */
pub val eth_p_ieeepupat = 0x0a01      // /* Xerox IEEE802.3 PUP Addr Trans packet */
pub val eth_p_batman = 0x4305         // /* B.A.T.M.A.N.-Advanced packet [ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_dec = 0x6000            // /* DEC Assigned proto           */
pub val eth_p_dna_dl = 0x6001         // /* DEC DNA Dump/Load            */
pub val eth_p_dna_rc = 0x6002         // /* DEC DNA Remote Console       */
pub val eth_p_dna_rt = 0x6003         // /* DEC DNA Routing      */
pub val eth_p_lat = 0x6004            // /* DEC LAR              */
pub val eth_p_diag = 0x6005           // /* DEC Diagnostics      */
pub val eth_p_cust = 0x6006           // /* DEC Customer use     */
pub val eth_p_sca = 0x6007            // /* DEC Systems Comms Arch       */
pub val eth_p_teb = 0x6558            // /* Trans Ether Bridging		*/
pub val eth_p_rarp = 0x8035           // /* Reverse Addr Res packet	*/
pub val eth_p_atalk = 0x809B          // /* Appletalk DDP		*/
pub val eth_p_arrp = 0x80F3           // /* Appletalk AARP		*/
pub val eth_p_8021Q = 0x8100          // /* 802.1Q VLAN Extended Header  */
pub val eth_p_erspan = 0x88BE         // /* ERSPAN type II		*/
pub val eth_p_ipx = 0x8137            // /* IPX over DIX			*/
pub val eth_p_ipv6 = 0x86DD           // /* IPv6 over bluebook		*/
pub val eth_p_pause = 0x8808          // /* IEEE Pause frames. See 802.3 31B */
pub val eth_p_slow = 0x8809           // /* Slow Protocol. See 802.3ad 43B */
pub val eth_p_wccp = 0x883E           // /* Web-cache coordination protocol 
                                      // defined in draft-wilson-wrec-wccp-v2-00.txt */
pub val eth_p_mpls_uc = 0x8847        // /* MPLS Unicast traffic		*/
pub val eth_p_mpls_mc =  0x8848       // /* MPLS Multicast traffic	*/
pub val eth_p_atmmpoa = 0x884c        // /* MultiProtocol Over ATM	*/
pub val eth_p_ppp_disc = 0x88863      // /* PPPoE discovery messages     */
pub val eth_p_ppp_ses = 0x8864        // /* PPPoE session messages	*/
pub val eth_p_link_ctl = 0x886c       // /* HPNA, wlan link local tunnel */
pub val eth_p_atmfate = 0x8884        // /* Frame-based ATM Transport over Ethernet /*
pub val eth_p_pae = 0x888E            // /* Port Access Entity (IEEE 802.1X) */
pub val eth_p_profinet =  0x8892      // /* PROFINET			*/
pub val eth_p_realtek = 0x8899        // /* Multiple proprietary protocols */
pub val eth_p_aoe = 0x88A2            // /* ATA over Ethernet		*/
pub val eth_p_ethercat = 0x88A4       // 	/* EtherCAT			*/
pub val eth_p_8012AD = 0x88A8         // /* 802.1ad Service VLAN		*/
pub val eth_p_802_ex1 = 0x88B5        // /* 802.1 Local Experimental 1.  */
pub val eth_p_preauth = 0x88C7        // /* 802.11 Preauthentication */
pub val eth_p_tipc = 0x88CA           // /* TIPC                     */
pub val eth_p_lldp = 0x88CC           // /* Link Layer Discovery Protocol */
pub val eth_p_mrp = 0x88E3            // /* Media Redundancy Protocol	*/
pub val eth_p_macsec = 0x88E5         // /* 802.1ae MACsec */
pub val eth_p_8021AH = 0x88E7         // /* 802.1ah Backbone Service Tag */
pub val eth_p_mvrp = 0x88F5           // /* 802.1Q MVRP                  */
pub val eth_p_1588 =  0x88F7          // /* IEEE 1588 Timesync */
pub val eth_p_ncsi = 0x88F8           // /* NCSI protocol		*/
pub val eth_p_prp = 0x88FB            // /* IEC 62439-3 PRP/HSRv0	*/
pub val eth_p_cfm = 0x8902            // /* Connectivity Fault Management */
pub val eth_p_fcoe = 0x8906           // /* Fibre Channel over Ethernet  */
pub val eth_p_iboe = 0x8915           // /* Infiniband over Ethernet	*/
pub val eth_p_tdls = 0x890D           // /* TDLS */
pub val eth_p_fip = 0x8914            // /* FCoE Initialization Protocol */
pub val eth_p_80221 = 0x8917          // /* IEEE 802.21 Media Independent Handover Protocol */
pub val eth_p_hsr = 0x892F            // /* IEC 62439-3 HSRv1	*/
pub val eth_p_nsh = 0x894F            // /* Network Service Header */
pub val eth_p_loopback = 0x9000       // /* Ethernet loopback packet, per IEEE 802.3 */
pub val eth_p_qinq1 = 0x9100          // /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_qinq2 = 0x9200          // /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_qinq3 = 0x9300          // /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_edsa = 0xDADA           // /* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_dsa_8021Q = 0xDADB      // /* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_dsa_A5PSW = 0xE001      // /* A5PSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_ife = 0xED3E            // /* ForCES inter-FE LFB type */
pub val eth_p_af_iucv =  0xFBFB       // /* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */
pub val eth_p_802_3_min = 0x0600      // /* If the value in the ethernet type is more than this value then the frame is Ethernet II. Else it is 802.3 */

pub struct tattribute "packed" ethhdr 
  //h_dest : array of char of size eth_alen (* add later *)
  //h_source : array of char of size eth_alen (* add later *)
  h_proto : int32    /* packet type ID field: it should be 16 bit, so we use shr operator to get the value */

pub fun main() {
  val l = Ethhdr(0.int32)
  return 0
}