Task 1 Questions:
(1) Output of nodes:
mininet> nodes
available nodes are:
c0 h1 h2 h3 h4 h5 h6 h7 h8 s1 s2 s3 s4 s5 s6 s7
    Output of net:
mininet> net
h1 h1-eth0:s3-eth1
h2 h2-eth0:s3-eth2
h3 h3-eth0:s4-eth2
h4 h4-eth0:s4-eth3
h5 h5-eth0:s6-eth2
h6 h6-eth0:s6-eth3
h7 h7-eth0:s7-eth2
h8 h8-eth0:s7-eth3
s1 lo:  s1-eth1:s2-eth3 s1-eth2:s5-eth1
s2 lo:  s2-eth1:s3-eth3 s2-eth2:s4-eth1 s2-eth3:s1-eth1
s3 lo:  s3-eth1:h1-eth0 s3-eth2:h2-eth0 s3-eth3:s2-eth1
s4 lo:  s4-eth1:s2-eth2 s4-eth2:h3-eth0 s4-eth3:h4-eth0
s5 lo:  s5-eth1:s1-eth2 s5-eth2:s6-eth1 s5-eth3:s7-eth1
s6 lo:  s6-eth1:s5-eth2 s6-eth2:h5-eth0 s6-eth3:h6-eth0
s7 lo:  s7-eth1:s5-eth3 s7-eth2:h7-eth0 s7-eth3:h8-eth0
c0

(2) Output of h7 config:

h7-eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.7  netmask 255.0.0.0  broadcast 10.255.255.255
        inet6 fe80::cca0:87ff:fec7:31e8  prefixlen 64  scopeid 0x20<link>
        ether ce:a0:87:c7:31:e8  txqueuelen 1000  (Ethernet)
        RX packets 56  bytes 4408 (4.4 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 9  bytes 726 (726.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Task 2 Questions:
1. # This must have a listener() ->
_handle_PacketIn(self, event) ->
act_like_hub(packet, packet_in) ->
resend_packet(packet_in, of.OFPP_ALL) -> (sent to all the ports that are connected)
connection.send(msg)
2.
 H1 ping h2 
(a) Avg: 0.879 (b)min: 0.631 max: 2.216
   H1 ping h8
   (a)avg: 3.540 (b) min: 2.856 max: 5.114
    (C ) difference reason: h1 to h2 has 2 paths; h1 to h8 has 6 paths, so it is further. Further means slower.
3. (a)  iperf: testing TCP bandwidth between two hosts 
¡@(b)  h1 and h2: 21.3 Mbits/sec    h1 and h8: 3.20 Mbits/sec
¡@(c)  reason for the difference: h1 to h2 only flows through one switch. However, h1 to h8 has to flow through 5 switches, and every switch will send out the packet to every other switches/host that has connection with it, so this will end up declining the bandwidth.
4. 

Task 3 Questions:
1.
MAC to Port map can only be added or build while in source side(sending in). 
If the source packet coming in from a particular port is not in the map yet, the switch will call a function to separate it to layer two and get the source MAC. After getting the source MAC, we use it as a key in the map with the source port being the value. Then ,we get a relationship between a particular MAC and a particular port. 
If you wish to send to destination MAC and you do not know the port, you will send the packet to all switches/hosts that you have connection with.
2. (a) H1 ping H2:  AVG : 0.888ms
¡@¡@H1 ping H8:   AVG: 3.131ms
(b) H1 ping H2:   min: 0.635 max: 1.167
   H1 ping H8:   min: 2.722 max: 4.566ms
(c) The bandwidth is not fully occupied in the network environment, so the response time of ping doesn¡¦t affect that much.
3.  (a) h1 h2 :  77.8 Mbits/sec
      H1 h8:  11.7 Mbits/sec
(b) Because we have a map in controller now, so the switch now can ask controller and then it looks up the map and know which port should a packet go. So in the network environment, there will be no redundant packets to occupy the network bandwidth
