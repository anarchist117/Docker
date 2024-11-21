FROM certbot/certbot

COPY cron /etc/crontabs
COPY entrypoint.sh /

RUN crontab /etc/crontabs/cron && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
