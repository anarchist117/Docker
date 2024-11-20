FROM ubuntu

RUN apt update && apt upgrade -y && \
    apt install -y --no-install-recommends \
    ocserv \
    gnutls-bin \
    iptables \
    nano \
    cron && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY cron /etc/cron.d/cron
COPY ocserv.conf \
     users.sh \
     entrypoint.sh \
     /

RUN chmod +x /users.sh /entrypoint.sh && \
    crontab /etc/cron.d/cron

EXPOSE 443/tcp

ENTRYPOINT ["/entrypoint.sh"]
