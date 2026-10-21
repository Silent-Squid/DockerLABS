#!/bin/bash
docker build -t dhcp3 .


ovs-vsctl add-br LAN1
ovs-vsctl add-br LAN2
ovs-vsctl add-br LAN3


docker run -it -d --cap-add=NET_ADMIN --sysctl net.ipv4.ip_forward=1 --name DHCP-SRV dhcp3

ovs-docker add-port LAN1 ilan1 DHCP-SRV --ipaddress="10.0.0.1/24"
ovs-docker add-port LAN2 ilan2 DHCP-SRV --ipaddress="20.0.0.1/24"
ovs-docker add-port LAN3 ilan3 DHCP-SRV --ipaddress="30.0.0.1/24"

genRA () {
local LAN=$1  mac=$2 secu=$3
for i in $(seq 1 $secu) ; do

	docker run -d -it --cap-add=NET_ADMIN --name "${LAN}Alpine${i}" --network=none alpine
	ovs-docker add-port $LAN "${LAN}Alpine${i}" "${LAN}Alpine${i}" --macaddress="$mac:1$i"
	docker exec -it "${LAN}Alpine${i}" udhcpc -i "${LAN}Alpine${i}"
done
}

bash ./iptables.sh


genRA LAN1 AA:AA:AA:AA:10 5
genRA LAN2 AA:AA:AA:AA:20 3
genRA LAN3 AA:AA:AA:AA:30 3

