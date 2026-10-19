#!/bin/bash/
docker rm -f alpine1
docker rm -f alpine2
docker rm -f alpine3
docker rm -f DHCP
ovs-vsctl del-br LAN1
