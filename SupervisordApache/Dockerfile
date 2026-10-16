FROM alpine:latest

RUN apk update; apk upgrade; apk add supervisor apache2; \
mkdir -p /var/log/apache2 /run/apache2; 

#chown apache2:apache2 -R /var/log/apache2 /run/apache2 

COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-n", "-c", "/etc/supervisord.conf"]
