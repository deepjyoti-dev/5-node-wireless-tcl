📡 NS2 MANET Simulation using AODV Routing

A wireless mobile ad hoc network simulation built using NS2 with:

AODV routing protocol
IEEE 802.11 wireless communication
UDP/CBR traffic generation
NAM visualization
Wireless topology simulation
Trace file analysis
🧠 Network Architecture

Your node layout forms a “plus-sign” wireless topology:

        n4
         |
n0 ---- n1 ---- n2
         |
        n3

Traffic Flow:

n0  --->  n4
⚙️ Simulation Parameters
Parameter	Value
Routing Protocol	AODV
MAC Protocol	IEEE 802.11
Queue Type	DropTail/PriQueue
Antenna	Omni-directional
Propagation Model	TwoRayGround
Traffic Type	UDP/CBR
Packet Size	512 bytes
Simulation Area	800x800
Nodes	5
🚀 Features
Wireless MANET simulation
Dynamic routing using AODV
Traffic flow visualization
Packet tracing
Network performance evaluation
Extensible architecture
▶️ Running the Simulation
Run Simulation
ns simulation/manet_aodv.tcl
Open NAM Visualization
nam out.nam
📊 Output Files
File	Purpose
out.tr	Packet trace log
out.nam	NAM animation
topology.png	Network topology image
