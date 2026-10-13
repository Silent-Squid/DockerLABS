# Lab Goals

The objetive of this lab it is to learn and practice the iptables linux tool and SDN with docker, making a complex topology with 8 clients and 4 networks. 

The use of openVswitch it is simply to have a precise control of the network and, in the future, create more realistic network topologies with VLANs, Bonds, QoS, Mirrors, and even, L3 switches. 

<br>

# Topology 

<img width="960" height="720" alt="SDN4lan" src="https://github.com/user-attachments/assets/2cf62ba3-3e03-4215-b03e-448fb6402670" />

- LAN1 y LAN3 will have conectivity
- LAN2 and LAN4 will have conectivity
- LAN1 and LAN4 will have internet access
- No client can have a direct connection with the router (ping, ssh...)

## Diagramm key

<img width="960" height="720" alt="leyenda" src="https://github.com/user-attachments/assets/4d14c8cf-c394-43e9-a0e5-417cd5da3572" />

## Router interfaces 

The router IP will always be X.10.10.1 where x is the LAN number (LAN1 10.10.10.1)

The router interfaces names will be ALANX where x is the LAN number

<br>

# IPTABLES

Some important details about my iptables decisions I must discuss are:

**Why the iptables script is not inside the container.** The reason: Docker behaves inconsistently with iptables scripts and network scripts. Seeing this strange behavior, I decided to do the scripting outside the container. In the script, I made the `Ciptables` function to avoid writing `docker exec alpine-router` every time.

Another detail I should discuss is being so specific in the iptables rules. The reason is the prevention of network vulnerabilities. Being so specific in the rules makes an attacker who connects to LAN1 and uses an IP from LAN2 unable to communicate with any device in LAN2. Only packets with input interface ALAN4 can communicate with LAN2.

```
iptables -A FORWARD -s 10.10.10.0/24 -i ALAN1 -o ALAN3 -d 30.10.10.0/24 -j ACCEPT
```

<br>

# How to Replicate

## Needed Components

- **Open vSwitch** installed with administrative permissions. The `ovs-docker` tool is usually installed by default with the Open vSwitch package. If it is not installed, you must install it manually.

- **Docker** installed with administrative permissions

## Requisites

In a virtual machine personally, I use `sudo`, `doas` or `root` user. If you are running the lab in your system, you should use an user with network, docker and OpenVSwitch permissions

In the device can not be a docker imaged nammed `alpine-router` or any virtual switches named `LANX` where x is a range between 1-4. 

In the device can not be any containers nammed `alpineX` where X is a ragne between 1-8

You always can modify the scripts if you don't comply with the requisites. 

## Execution Order

1. Run the image creation script fo `alpine-router` (`DockerFile.dir/DockerBuild.sh`)
This is the only step that you can skip if you already have the image created
2. Run the deploy script (`SDN.sh`)
3. For deleting everithing you must run (`KILL.sh`)
4. Redo the steps 2 and 3 the amount of times you want to run the lab

**`CAUTION`** the docker image is not deleted with `KILL.sh`
6. 



