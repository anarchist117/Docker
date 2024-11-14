FROM certbot/certbot

COPY certbot-renew /etc/crontabs
COPY entrypoint.sh /entrypoint.sh

RUN crontab /etc/crontabs/certbot-renew
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
