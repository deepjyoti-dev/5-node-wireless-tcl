# Create simulator instance
set ns [new Simulator]

# Create trace and NAM files
set tracefile [open out.tr w]
$ns trace-all $tracefile

set namfile [open out.nam w]
$ns namtrace-all-wireless $namfile 800 800

# Define topography
set topo [new Topography]
$topo load_flatgrid 800 800

# Node configuration for wireless
$ns node-config -adhocRouting AODV \
    -llType LL \
    -macType Mac/802_11 \
    -ifqType Queue/DropTail/PriQueue \
    -ifqLen 50 \
    -antType Antenna/OmniAntenna \
    -propType Propagation/TwoRayGround \
    -phyType Phy/WirelessPhy \
    -channelType Channel/WirelessChannel \
    -topoInstance $topo \
    -agentTrace ON \
    -routerTrace ON \
    -macTrace ON

# Create 5 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

# Initial node positions (like a plus sign layout)
$n0 set X_ 100; $n0 set Y_ 400; $n0 set Z_ 0
$n1 set X_ 300; $n1 set Y_ 400; $n1 set Z_ 0
$n2 set X_ 500; $n2 set Y_ 400; $n2 set Z_ 0
$n3 set X_ 300; $n3 set Y_ 200; $n3 set Z_ 0
$n4 set X_ 300; $n4 set Y_ 600; $n4 set Z_ 0

# Define initial positions (static)
$ns at 0.0 "$n0 setdest 100 400 0"
$ns at 0.0 "$n1 setdest 300 400 0"
$ns at 0.0 "$n2 setdest 500 400 0"
$ns at 0.0 "$n3 setdest 300 200 0"
$ns at 0.0 "$n4 setdest 300 600 0"

# Create UDP/CBR traffic from n0 to n4
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

set null4 [new Agent/Null]
$ns attach-agent $n4 $null4

$ns connect $udp0 $null4

set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 512
$cbr0 set interval_ 0.1
$cbr0 attach-agent $udp0

# Start and stop times
$ns at 1.0 "$cbr0 start"
$ns at 4.5 "$cbr0 stop"

# Finish procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}

$ns at 5.0 "finish"

# Run simulation
$ns run
