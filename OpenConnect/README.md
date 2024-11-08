# 1. Deploy
```
docker build -t ocserv .
docker compose up -d
docker exec -it ocserv bash
```

# 2. Create User and Certificate
## VPN User
```
ocpasswd -c /etc/ocserv/passwd client
```

## Certificate
### CA
```
certtool --generate-privkey --outfile ca.key
certtool --generate-self-signed --load-privkey ca.key --template ca.tmpl --outfile ca.pem
```
### Client
```
certtool --generate-privkey --outfile client.key
certtool --generate-certificate --load-privkey client.key --load-ca-certificate ca.pem --load-ca-privkey ca.key --template client.tmpl --outfile client.pem
certtool --to-p12 --load-privkey client.key --load-certificate client.pem --pkcs-cipher aes-256 --outfile client.p12 --outder
```

# 3. Connect
Windows [OpenConnect VPN](https://gui.openconnect-vpn.net/download)

iOS [Cisco Secure Client](https://apps.apple.com/us/app/cisco-secure-client/id1135064690)


# Documentation
[Ocserv Configuration - Basic](https://docs.openconnect-vpn.net/recipes/ocserv-configuration-basic/) 

[How to Set Up OpenVPN with Stunnel on Ubuntu 24.04 Server](https://www.linuxbabe.com/ubuntu/set-up-openvpn-with-stunnel-on-ubuntu-24-04-server)

[Set Up OpenConnect VPN Server (ocserv) on Ubuntu 22.04 with Let’s Encrypt](https://www.linuxbabe.com/ubuntu/openconnect-vpn-server-ocserv-ubuntu-16-04-17-10-lets-encrypt)
