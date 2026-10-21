# Laboratorio

El objetivo de este laboratorio es aplicar los aprendizajes de `IPTABLES`, `SUPERVISORD` y `KEA-DHCP4` en un laboratorio complejo.

Las reglas del firewall se aplicarán antes de que los clientes obtengan IP via DHCP. Para saber que todo funciona correctamente


## Topología

<img width="960" height="720" alt="Topología compleja KEA" src="https://github.com/user-attachments/assets/de0d3f56-45d3-424e-aa55-bce80a006fff" />

## Enrutamiento de iptables

- LAN1 No tendrá comunicación con ninguna otra LAN. Tampoco tendrá comunicación con el router para nada que no sea el DHCP. 
