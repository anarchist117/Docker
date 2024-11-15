FROM ubuntu

RUN apt update && apt upgrade -y
RUN apt install ocserv -y
RUN apt install gnutls-bin -y
RUN apt install iptables -y
RUN apt install nano -y
RUN apt install cron -y

COPY ocserv.conf /ocserv.conf
COPY users /etc/cron.d/users
COPY users.sh /users.sh
COPY entrypoint.sh /entrypoint.sh

RUN crontab /etc/cron.d/users
RUN chmod +x /users.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443/tcp

ENTRYPOINT ["/entrypoint.sh"]
