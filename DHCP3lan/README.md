# Laboratorio

El objetivo de este laboratorio es aplicar los aprendizajes de `IPTABLES`, `SUPERVISORD` y `KEA-DHCP4` en un laboratorio complejo.

Las reglas del firewall se aplicarán antes de que los clientes obtengan IP via DHCP. Para saber que todo funciona correctamente. Con solo iptables, a no ser que usemos VLANs o un sistema restrictivo de asignación de IPs, es imposbile bloquear el DHCP en las reglas, ya que es un protocolo que trabaja en L2 del modelo TCP/IP de 5 niveles.


## Topología

<img width="960" height="720" alt="Topología compleja KEA" src="https://github.com/user-attachments/assets/de0d3f56-45d3-424e-aa55-bce80a006fff" />

## DHCP

- LAN1:
    - El primer cliente del DHCP obtendrá la ip 10.0.0.10
    - El segundo cliente del DHCP obtendrá la ip 10.0.0.20
    - A partir del clienente 3, el rango de ip será entre 10.0.0.50-10.0.0.150
    - Un cliente (en este caso alpine4) tendrá la MAC AA:AA:AA:AA:10:14. Tendrá la ip 10.0.0.204
    - Un cliente (en este caso alpine5) tendrá la MAC AA:AA:AA:AA:10:15. Tendrá la ip 10.0.0.205
 


## Enrutamiento de iptables

- LAN1 Tendrá comunicación con LAN2 e INTERNET
- LAN2 No tendrá ninguna comunicación
- LAN3 No tendrá ninguna comunicación
