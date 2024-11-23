FROM certbot/certbot

COPY cron /etc/crontabs/cron
COPY certbot.sh \
     entrypoint.sh \
     /

RUN chmod +x /certbot.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
