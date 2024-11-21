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
COPY users.sh \
     entrypoint.sh \
     /

RUN crontab /etc/cron.d/cron && \
    chmod +x /users.sh /entrypoint.sh

EXPOSE 443/tcp

ENTRYPOINT ["/entrypoint.sh"]
