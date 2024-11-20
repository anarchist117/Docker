#!/bin/sh

iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

if [ ! -f /etc/ocserv/ocserv.conf ]; then
  echo "Create ocserv.conf"
  cp /ocserv.conf /etc/ocserv/ocserv.conf
  fullchain=/etc/ocserv/le/live/${Domain}/fullchain.pem
  privkey=/etc/ocserv/le/live/${Domain}/privkey.pem
  sed -i "s|^server-cert =.*|server-cert = ${fullchain}|" /etc/ocserv/ocserv.conf
  sed -i "s|^server-key =.*|server-key = ${privkey}|" /etc/ocserv/ocserv.conf
fi

if [ ! -d /etc/ocserv/ssl/ ]; then
  mkdir /etc/ocserv/ssl/
  cd /etc/ocserv/ssl/

  echo "Create ca.tmpl and user.tmpl"
  cat > ca.tmpl <<EOF
organization = $Domain
cn = $CA_Name
serial = 001
expiration_days = -1
ca
signing_key
cert_signing_key
crl_signing_key
EOF
  cat > user.tmpl <<EOF
organization = $Domain
cn =
uid =
expiration_days = $Expiration
tls_www_client
signing_key
encryption_key
EOF

  echo "Create ca.key"
  certtool --generate-privkey --outfile ca.key > /dev/null 2>&1

  echo "Create ca.pem"
  certtool --generate-self-signed --load-privkey ca.key --template ca.tmpl --outfile ca.pem > /dev/null 2>&1
  mkdir -p /etc/ocserv/users
  cp /etc/ocserv/ssl/ca.pem /etc/ocserv/users/ca.cer
fi

echo ""

ocserv -c /etc/ocserv/ocserv.conf -f &
cron -f
