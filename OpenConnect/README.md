# 
```
# Create User
ocpasswd -c /etc/ocserv/passwd vpn1
```
```
certtool --generate-privkey --outfile ca.key
certtool --generate-self-signed --load-privkey ca.key --template ca.tmpl --outfile ca.pem
```
```
certtool --generate-privkey --outfile client.key
certtool --generate-certificate --load-privkey client.key --load-ca-certificate ca.pem --load-ca-privkey ca.key --template client.tmpl --outfile client.pem
certtool --to-p12 --load-privkey client.key --load-certificate client.pem --pkcs-cipher aes-256 --outfile client.p12 --outder
```

# Download
https://www.infradead.org/openconnect/download/

https://www.infradead.org/ocserv/download/

# Documentation
https://docs.openconnect-vpn.net/recipes/ocserv-configuration-basic/

https://www.linuxbabe.com/ubuntu/set-up-openvpn-with-stunnel-on-ubuntu-24-04-server

https://www.linuxbabe.com/ubuntu/certificate-authentication-openconnect-vpn-server-ocserv
