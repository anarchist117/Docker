FROM ubuntu

ENV TZ=Europe/Moscow

RUN apt update && apt upgrade -y
RUN apt install ocserv -y
RUN apt install certbot -y

# Lets Encrypt
EXPOSE 80/tcp

# OCServ
EXPOSE 443/tcp 
EXPOSE 443/udp
