# Objetivo del laboratorio

El objetivo es aprender y practicar el firewal de iptables junto a SDN y docker creando una topología compleja de 8 clientes

La utilización de openVswitch es simplemente para tener un control más preciso de la red y, en un futuro, crear topologías de red más realistas mediante el uso de Vlanes, Bonds, QoS, Mirrors e incluso switches de L3

# Topología 

La topología es la siguiente:















Los dispositivos del mismo color tendrán conexión entre ellos, los oscuros también tendrán acceso a internet vía alpine-router

Ningún cliente podrá tener conexión con el router, no ping, no ssh, nada
