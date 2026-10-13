# Objetivo del laboratorio

El objetivo es aprender y practicar el firewal de iptables junto a SDN y docker creando una topología compleja de 8 clientes

La utilización de openVswitch es simplemente para tener un control más preciso de la red y, en un futuro, crear topologías de red más realistas mediante el uso de Vlanes, Bonds, QoS, Mirrors e incluso switches de L3

# Topología 

La topología es la siguiente:

<img width="960" height="720" alt="SDN4lan" src="https://github.com/user-attachments/assets/2cf62ba3-3e03-4215-b03e-448fb6402670" />

- LAN1 y LAN3 tendrán conectividad
- LAN2 y LAN4 tendrán conectividad
- LAN1 y LAN4 tendrán internet

## **LEYENDA**:

<img width="960" height="720" alt="leyenda" src="https://github.com/user-attachments/assets/4d14c8cf-c394-43e9-a0e5-417cd5da3572" />


## Interfaces de red 

El router tendrá siempre la ip x.10.10.1/24. 

Las interfaces del router son  ALANX donde x es el número de la LAN al a que pertenece la interfaz 
















Los dispositivos del mismo color tendrán conexión entre ellos, los oscuros también tendrán acceso a internet vía alpine-router

Ningún cliente podrá tener conexión con el router, no ping, no ssh, nada
