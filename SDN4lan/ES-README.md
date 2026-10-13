# Objetivo del laboratorio

El objetivo es aprender y practicar el firewal de iptables junto a SDN y docker creando una topología compleja de 8 clientes

La utilización de openVswitch es simplemente para tener un control más preciso de la red y, en un futuro, crear topologías de red más realistas mediante el uso de Vlanes, Bonds, QoS, Mirrors e incluso switches de L3

<br>

# Topología 

La topología es la siguiente:

<img width="960" height="720" alt="SDN4lan" src="https://github.com/user-attachments/assets/2cf62ba3-3e03-4215-b03e-448fb6402670" />

- LAN1 y LAN3 tendrán conectividad
- LAN2 y LAN4 tendrán conectividad
- LAN1 y LAN4 tendrán internet
- Ningún cliente podrá tener conexión directa con el router, no ping, no ssh, nada

## **LEYENDA**:

<img width="960" height="720" alt="leyenda" src="https://github.com/user-attachments/assets/4d14c8cf-c394-43e9-a0e5-417cd5da3572" />


## Interfaces de red 

El router tendrá siempre la ip X.10.10.1.  (LAN1 10.10.10.1)

Las interfaces del router son  ALANX donde x es el número de la LAN al a que pertenece la interfaz 

<br>

# IPTABLES

Una cosa que quería comentar es, por qué el script de iptables no se encuentra dentro del contenedor. La razón, docker se comporta muy extraño ante los scripts de red y iptables dentro de si mismo. Viendo esto, he decidido tener el control completo desde el host. 

Otra cosa que puede ser controvertida es, ser tan específico en las reglas de iptables. La razón es la prevención de vulnerabilidades mediante la red. Si se es muy específico, aunque se conecte un dispositivo a la LAN3 y utilice la ip de la LAN2 no puedan tener conexión ni de lejos, al especificar las interfaces de entrada y salida. Es más trabajo, pero ¿cuanto se gana en seguridad? La respuesta es: Bastante. 


Un ejemplo de la regla:

```
iptables -A FORWARD -s 10.10.10.0/24 -i ALAN1 -o ALAN3 -d 30.10.10.0/24 -j ACCEPT
```

Otra cosa que hay que recalcar, es la utilización de Ciptables para no tener que escribir `docker exec alpine-router` constantemente en cada linea. 


# ¿Cómo replicarlo en tu dispositivo o máquina virtual?

## Componentes necesarios 

- openVswitch instalado y con permisos de administración . También el componente ovs-docker si no se instala por defecto
- docker instalado  y con permisos de administración

## Requisitos

En una máquina virtual yo usaría `sudo`o el usuario `root`. Si es tu máquina personal recomiendo utilizar un usuario con acceso a la red, `openvswitch` y `docker`

No deberá existir ninguna imagen en tu equipo llamada `alpine-router` o switches virtuales llamados `LANX` donde x es un rango entre 1-4. Tampoco deberás tener contenedores llamados `alpinex` donde x es un rango entre 1 y 8. Tampoco podrá existir una red llamada SDN4lan de docker.

Siempre puedes modificar el script si no cumples los requisitos, pero no me hago cargo. 

## Orden de ejecución 

1. Ejecución del scrip de creación de imagen `alpine-router` en la ruta `DockerFile.dir/DockerBuild.sh`

El paso nº 1 se deberá hacer solo si se modifica el dockerfile o no tienes o se ha borrado la imagen

2. Ejecución de los contenedores y la red, con el script `SDN.sh`

3. Cuando hayas terminado, ejecuta el script `KILL.sh` para destruir toda la red y los contenedores

4. Repite el paso 2 y 3 cada vez que quieras lanzar y destruir la topología. 

**ATENCIÓN la imagen de docker no se borra con el script `KILL.sh`**



