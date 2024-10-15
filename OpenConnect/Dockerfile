FROM ubuntu

ENV TZ=Europe/Moscow

RUN apt update && apt upgrade -y
RUN apt install ocserv -y
RUN apt install certbot -y

WORKDIR ./ocserv

EXPOSE 443/tcp
EXPOSE 443/udp
