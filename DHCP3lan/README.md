# Laboratorio

El objetivo de este laboratorio es aplicar los aprendizajes de `IPTABLES`, `SUPERVISORD` y `KEA-DHCP4` en un laboratorio complejo.

Las reglas del firewall se aplicarán antes de que los clientes obtengan IP via DHCP. Para saber que todo funciona correctamente. Con solo iptables, a no ser que usemos VLANs o un sistema restrictivo de asignación de IPs, es imposbile bloquear el DHCP en las reglas, ya que es un protocolo que trabaja en L2 del modelo TCP/IP de 5 niveles.


## Topología

<img width="960" height="720" alt="Topología compleja KEA" src="https://github.com/user-attachments/assets/de0d3f56-45d3-424e-aa55-bce80a006fff" />

## Enrutamiento de iptables

- LAN1 No tendrá ninguna comunicación
- LAN2 No tendrá ninguna comunicación
- LAN3 No tendrá ninguna comunicación
