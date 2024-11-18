#!/bin/sh

iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

if [ ! -f /etc/ocserv/ocserv.conf ]; then
  echo "Create ocserv.conf"
  cp /ocserv.conf /etc/ocserv/ocserv.conf
fi

if [ ! -d /etc/ocserv/ssl/ ]; then
  mkdir /etc/ocserv/ssl/
  cd /etc/ocserv/ssl/

  echo "Create ca.tmpl"
  cat > ca.tmpl <<EOF
organization = $DOMAIN
cn = $CA_Name

serial = 001
expiration_days = -1
ca

signing_key
cert_signing_key
crl_signing_key
EOF

  echo "Create ca.key"
  certtool --generate-privkey --outfile ca.key

  echo "Create ca.pem"
  certtool --generate-self-signed --load-privkey ca.key --template ca.tmpl --outfile ca.pem
fi

ocserv -c /etc/ocserv/ocserv.conf -f &
cron -f
