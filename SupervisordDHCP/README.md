# Objetivos

El objetivo del laboratorio es, crear una topología simple con `supervisord` para gestionar los servicios y `kea` para entregar a una red L2 acceso a la red LAN1 y a internet mediante `iptables`.  

## ¿Por qué utilizar supervisord?

Para poder tener más de un servicio en un contenedor necesitaremos un controlador de procesos del sistema; supervisord es simple y cómodo de utilizar. 
Aunque tener más de un servicio en un contenedor rompe con la idea principal de la arquitectura de sistemas contenerizados (un contenedor por servicio), hay veces que no va a ser posible. Por esto hay que saber trabajar con un gestor de procesos simple.
Para sistemas embedidos y ligeros supervisord nos puede ser de una gran utilidad también. 

Pero estos no son los principales motivos. Utilizaremos supervisord en un contenedor, porque queremos simular un servidor con múltiples contenedores. En lugar de utilizar una pesada máquina virtual, utilizamos contenedores para hacer topologías complejas 
que, utilizando máquinas virtuales, requerirían ordenadores de la NASA. 

Si se implementa un servidor multiservicio, siempre que no sea extrictamente necesario, no correremos más de un servicio por contenedor. 

## ¿Por que utilizar kea?

En los ciclos formativos de informática de grado medio y grado superior en España, `isc-dhcp-server` es un estándar en servicios de DHCP. Muchos servidores relativamente antiguos (2-3 años o más de antigüedad) siguen utilizando este servicio. 
**está completamente desactualizado** y está completamente muerto desde el 2022.

`Kea` es el nuevo servicio de DHCP estándar creado por `ISC` con una estructura de ficheros de configuración simplemente, increíble. 

# Topología


<img width="466" height="606" alt="image" src="https://github.com/user-attachments/assets/51fea801-671c-4f89-a5e2-7d49a48549f4" />

Como puedes ver, la topología es mucho más sencilla que la anterior 

# Preparación

El dispositivo `alpine-router` tendrá una interfaz de red NAT generada por docker y otra llamada LAN1I para la red LAN1. 

El dispositivo `LAN1` es un switch L2 de openVswitch.

Los clientes `alpineX` son simples con bussybox y el cliente de dhcp `udhcpc`
La red es `10.10.10.0/24` con gateway `10.10.10.1/24` con un rango de DHCP de `10.10.10.10-40/24`


