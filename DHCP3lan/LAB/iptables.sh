#!/bin/bash

rafiptables () { # it's called rafiptables because one of my system admin teachers it's called rafa
docker exec -it DHCP-SRV iptables $@
}

# DEFAULT POLICY
rafiptables -P INPUT DROP
rafiptables -P FORWARD DROP

rafiptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
rafiptables -A INPUT  -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# SUPERVISORD

rafiptables -A INPUT -p tcp --dport 10000 -j ACCEPT

#LAN1

rafiptables -A FORWARD -i ilan1 -s 10.0.0.0/24 -o ilan2 -d 20.0.0.0/24 -j ACCEPT
rafiptables -A FORWARD -i ilan1 -s 10.0.0.0/24 -o eth0 -j ACCEPT

#LAN2

rafiptables -A FORWARD -i ilan2 -s 20.0.0.0/24 -o ilan3 -d 30.0.0.0/24 -j ACCEPT

#LAN3

rafiptables -A FORWARD -i ilan3 -s 30.0.0.0/24 -o ilan1 -d 10.0.0.0/24 -j ACCEPT
rafiptables -A FORWARD -i ilan3 -s 30.0.0.0/24 -o ilan2 -d 20.0.0.0/24 -j ACCEPT
rafiptables -A FORWARD -i ilan3 -s 30.0.0.0/24 -o eth0  -j ACCEPT

# ENMASCARAMIENTO
rafiptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
