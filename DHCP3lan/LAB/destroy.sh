#!/bin/bash

# It's a little mess, i can do it with a bucle, but ctrl + c and ctrl + v it's esier in this case

ovs-vsctl del-br LAN1
ovs-vsctl del-br LAN2
ovs-vsctl del-br LAN3

docker rmi -f dhcp3
docker rm -f DHCP-SRV


docker rm -f LAN1Alpine1
docker rm -f LAN1Alpine2
docker rm -f LAN1Alpine3
docker rm -f LAN1Alpine4
docker rm -f LAN1Alpine5

docker rm -f LAN2Alpine1
docker rm -f LAN2Alpine2
docker rm -f LAN2Alpine3

docker rm -f LAN3Alpine1
docker rm -f LAN3Alpine2
docker rm -f LAN3Alpine3
