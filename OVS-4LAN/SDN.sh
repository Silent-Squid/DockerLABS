#!/bin/bash/ -x

netdeploy () {
	local n1=$1 n2=$2 n_name=$3 net=$4 gateway=$5

		ovs-vsctl add-br $n_name
		z=1
	for i in $(seq $n1 $n2) ; do

		docker run -it -d --name alpine$i --network=none alpine
		ovs-docker add-port $3 alpine$i alpine$i --ipaddress="${net}.10.10.${z}0/24" --gateway="$gateway"
		((z++))
	done




}

netdeploy 1 2 LAN1 10 10.10.10.1
netdeploy 3 4 LAN2 20 20.10.10.1
netdeploy 5 6 LAN3 30 30.10.10.1
netdeploy 7 8 LAN4 40 40.10.10.1

docker network create --driver bridge SDN4lan
docker run -it -d --name alpine-router --cap-add=NET_ADMIN --network=SDN4lan --sysctl net.ipv4.ip_forward=1 alpine-router

for i in $(seq 1 4); do

	ovs-docker add-port LAN$i ALAN$i alpine-router --ipaddress="${i}0.10.10.1/24"

done

bash ./IPTABLES.sh

echo 'Listo Calisto :^ !!!'
