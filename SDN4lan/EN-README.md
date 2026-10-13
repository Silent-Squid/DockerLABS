# Lab Goals

The objetive of this lab it is to learn and practice the iptables linux tool and SDN with docker, making a complex topology with 8 clients and 4 networks. 

The use of openVswitch it is simply to have a precise control of the network and, in the future, create more realistic network topologies with VLANs, Bonds, QoS, Mirrors, and even, L3 switches. 

# Topology 

<img width="960" height="720" alt="SDN4lan" src="https://github.com/user-attachments/assets/2cf62ba3-3e03-4215-b03e-448fb6402670" />

- LAN1 y LAN3 will have conectivity
- LAN2 and LAN4 will have conectivity
- LAN1 and LAN4 will have internet access

## Diagramm key

<img width="960" height="720" alt="leyenda" src="https://github.com/user-attachments/assets/4d14c8cf-c394-43e9-a0e5-417cd5da3572" />

## Router interfaces 

The router IP will always be X.10.10.1 where x is the LAN number (LAN1 10.10.10.1)

The router interfaces names will be ALANX where x is the LAN number

# IPTABLES

Some importants details of my iptables decisions I must discuss are: 

Why the iptables script is not inside the container. The reason, docker behaves inconsistently  with iptables scripts and network scripts. Watching this strange behave, I decisided to do the scripting outside the container. 



