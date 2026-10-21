FROM alpine:latest
RUN apk update; apk upgrade; apk add supervisor iptables kea-dhcp4; mkdir -p /run/kea/ /lib/kea/ /var/log/kea
COPY supervisord.conf /etc/supervisord.conf
COPY kea.conf /etc/kea/kea.conf

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-n", "-c", "/etc/supervisord.conf"]
