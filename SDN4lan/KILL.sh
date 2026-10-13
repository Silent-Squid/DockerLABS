#!/bin/bash

# Utiliza este script para matar a TODOS, los contenedores de esta topología :}


docker rm -f alpine1
docker rm -f alpine2
docker rm -f alpine3
docker rm -f alpine4
docker rm -f alpine5
docker rm -f alpine6
docker rm -f alpine7
docker rm -f alpine8
docker rm -f alpine-router
docker network rm SDN4lan

echo "Kiling LAN1"
ovs-vsctl del-br LAN1
echo "Kiling LAN2"
ovs-vsctl del-br LAN2
echo "Kiling LAN3"
ovs-vsctl del-br LAN3
echo "Kiling LAN4"
ovs-vsctl del-br LAN4



