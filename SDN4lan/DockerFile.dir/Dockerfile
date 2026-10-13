FROM alpine:latest

# COPY ./iptables.sh /iptables.sh  ¿Por quñe no usar esto dentro del contenedor, pues porque da fallos,  mejor hacerlo externamente
RUN apk update && apk upgrade; apk add iptables


CMD ["/bin/sh"]
