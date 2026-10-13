#!/bin/sh

set -x

Ciptables () {
	docker exec alpine-router iptables "$@"
}


# Políticas por defecto
Ciptables -P INPUT DROP
Ciptables -P FORWARD DROP

# Conntrack - me ha dado más de un dolor de cabeza, es IMPORTANTÍSIMO
Ciptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
Ciptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


# LAN1
Ciptables -A FORWARD -s 10.10.10.0/24 -i ALAN1 -o ALAN3 -d 30.10.10.0/24 -j ACCEPT #Conexión completa con la LAN3
Ciptables -A FORWARD -s 10.10.10.0/24 -i ALAN1 -o eth0 -j ACCEPT #Conexión a internet

# LAN2
Ciptables -A FORWARD -s 20.10.10.0/24 -i ALAN2 -o ALAN4 -d 40.10.10.0/24 -j ACCEPT #Conexión completa con la LAN4


# LAN3
Ciptables -A FORWARD -s 30.10.10.0/24 -i ALAN3 -o ALAN1 -d 10.10.10.0/24 -j ACCEPT # Conexión completa con la LAN1

# LAN4

Ciptables -A FORWARD -s 40.10.10.0/24 -i ALAN4 -o ALAN2 -d 20.10.10.0/24 -j ACCEPT # Conexion completa con LAN2
Ciptables -A FORWARD -s 40.10.10.0/24 -i ALAN4 -o eth0 -j ACCEPT # Conexión a internet


# ENMASCARAMIENTO DE LA RED NAT/WAN

Ciptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
