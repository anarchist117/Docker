# 1. Deploy
```
docker compose up -d && docker compose logs -f
```

# 2. Create User and Certificate
## Container console
```
docker exec -it ocserv bash
```
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
certtool --generate-privkey --outfile user.key
certtool --generate-certificate --load-ca-certificate ca.pem --load-ca-privkey ca.key --template user.tmpl --load-privkey user.key --outfile user.pem
certtool --to-p12 --load-certificate user.pem --load-privkey user.key --pkcs-cipher aes-256 --outfile user.p12 --outder
```

# 3. Connect
Windows [OpenConnect VPN](https://gui.openconnect-vpn.net/download)

iOS [Cisco Secure Client](https://apps.apple.com/us/app/cisco-secure-client/id1135064690)


# Documentation
[Ocserv Configuration - Basic](https://docs.openconnect-vpn.net/recipes/ocserv-configuration-basic/) 

[How to Set Up OpenVPN with Stunnel on Ubuntu 24.04 Server](https://www.linuxbabe.com/ubuntu/set-up-openvpn-with-stunnel-on-ubuntu-24-04-server)

[Set Up OpenConnect VPN Server (ocserv) on Ubuntu 22.04 with Let’s Encrypt](https://www.linuxbabe.com/ubuntu/openconnect-vpn-server-ocserv-ubuntu-16-04-17-10-lets-encrypt)
