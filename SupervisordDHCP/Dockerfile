FROM alpine:latest

RUN apk update; apk update; apk add supervisor kea-dhcp4 iptables; \
mkdir -p /run/kea /var/log/kea /var/lib/kea

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./kea.conf /etc/kea/kea.conf

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-n", "-c", "/etc/supervisord.conf"]
