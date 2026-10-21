# Laboratorio

El objetivo de este laboratorio es aplicar los aprendizajes de `IPTABLES`, `SUPERVISORD` y `KEA-DHCP4` en un laboratorio complejo.

Las reglas del firewall se aplicarán antes de que los clientes obtengan IP via DHCP. Para saber que todo funciona correctamente. 

## Bloqueo DHCP

¿Por qué el DHCP no se bloquea con la política por defecto drop?

Porque no es tráfico de L3/4, en el que trabaja iptables. Es tráfico de L2 (enlace de datos). Necesitaremos un firewall de capa 2 para filtrar este tráfico, o ser más específicos con la configuración de kea (kea es extremadamente potente)

## Topología

<img width="960" height="720" alt="Topología compleja KEA" src="https://github.com/user-attachments/assets/de0d3f56-45d3-424e-aa55-bce80a006fff" />

## Interfaces del servidor

Las interfaces del router serán 

- ilan1 10.0.0.1
- ilan2 20.0.0.1
- ilan3 30.0.0.1
- eth0 docker bridge network con conexión a internet


## DHCP

Rangos de IP caóticos, para llevar al límite la configuración básica. 

- LAN1:
    - El primer cliente del DHCP obtendrá la ip 10.0.0.10
    - El segundo cliente del DHCP obtendrá la ip 10.0.0.20
    - A partir del clienente 3, el rango de ip será entre 10.0.0.50-10.0.0.150
    - Un cliente (en este caso alpine4) tendrá la MAC AA:AA:AA:AA:10:14. Tendrá la ip 10.0.0.204
    - Un cliente (en este caso alpine5) tendrá la MAC AA:AA:AA:AA:10:15. Tendrá la ip 10.0.0.205

- LAN2:
   - El rango es entre la 20.0.0.15 y 20.0.0.30

- LAN3
    - El rango es 30.0.0.124-30.0.0.150 

Aun que todos las rutas por defecto sean .1, deberán ser especificadas en el DHCP.


## Enrutamiento de iptables

- Se deberá poder acceder a SUPERVISORD web desde cualquier sitio (Es inseguro para entornos de producción, pero para estos laboratorios nos sirve)
- Las políticas por defecto deben ser DROP
- Todas las políticas deben ser muy específicas
- Todas las comunicaciones ya establecidad o relacionadas deben funcionar correctamente
  
- LAN1 Tendrá comunicación con LAN2 e INTERNET
- LAN2 Tendrá comunicacion con LAN3
- LAN3 Tendrá comunicación con LAN1 y LAN2 e INTERNET


# Requisitos 

# Como replicar







---

Tenemos muchas ip diferentes y muchos clientes... ¿Por qué no usar un DNS...? (pista al prox lab >;^)
