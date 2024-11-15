FROM ubuntu

RUN apt update && apt upgrade -y
RUN apt install ocserv -y
RUN apt install gnutls-bin -y
RUN apt install iptables -y
RUN apt install nano -y
RUN apt install cron -y

COPY ocserv.conf /ocserv.conf
COPY cron /etc/cron.d/cron
COPY users.sh /users.sh
COPY entrypoint.sh /entrypoint.sh

RUN crontab /etc/cron.d/cron
RUN chmod +x /users.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443/tcp

ENTRYPOINT ["/entrypoint.sh"]
