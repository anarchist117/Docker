FROM ubuntu

RUN apt update && apt upgrade -y && \
    apt install -y \
    ocserv \
    gnutls-bin \
    iptables \
    nano \
    cron

COPY cron /etc/cron.d/cron
COPY ocserv.conf \
     users.sh \
     entrypoint.sh \
     /

RUN crontab /etc/cron.d/cron
RUN chmod +x \
    /users.sh \
    /entrypoint.sh

EXPOSE 443/tcp

ENTRYPOINT ["/entrypoint.sh"]
