#!/bin/bash/

docker build -t dhcpd .

ovs-vsctl add-br LAN1

for i in $(seq 1 3); do
	docker run -it -d --name alpine$i --network=none --cap-add=NET_ADMIN alpine
	ovs-docker add-port LAN1 AL$i alpine$i
done


ovs-docker del-port LAN1 AL3 alpine3
ovs-docker add-port LAN1 AL3 alpine3 --macaddress="AA:AA:AA:10:10:10"

docker run -d -p 10000 -p 67 --network=bridge --cap-add=NET_ADMIN --name DHCP --sysctl net.ipv4.ip_forward=1 dhcpd
ovs-docker add-port LAN1 ILAN1 DHCP --ipaddress="10.10.10.1/24"

docker exec DHCP iptables -A FORWARD -i ILAN1 -s 10.10.10.0 -j ACCEPT
docker exec DHCP iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
docker exec DHCP iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


for i in $(seq 1 3); do
	docker exec alpine$i udhcpc -i AL$i
done
