#!/bin/sh

iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

if [ ! -f /etc/ocserv/ocserv.conf ]; then
  echo "Create ocserv.conf"
  cat > /etc/ocserv/ocserv.conf <<EOF
auth = "certificate"
tcp-port = 443

run-as-user = ocserv
run-as-group = ocserv
socket-file = /run/ocserv-socket
chroot-dir = /var/lib/ocserv
server-cert = /etc/ocserv/le/live/${Domain}/fullchain.pem
server-key = /etc/ocserv/le/live/${Domain}/privkey.pem
ca-cert = /etc/ocserv/ssl/ca.pem
isolate-workers = true

max-clients = 100
max-same-clients = 1
rate-limit-ms = 100
server-stats-reset-time = 604800

keepalive = 32400
dpd = 90
mobile-dpd = 1800
switch-to-tcp-timeout = 25
try-mtu-discovery = true

cert-user-oid = 0.9.2342.19200300.100.1.1
tls-priorities = "NORMAL:%SERVER_PRECEDENCE:%COMPAT:-VERS-SSL3.0:-VERS-TLS1.0:-VERS-TLS1.1:-VERS-TLS1.3"

auth-timeout = 240
min-reauth-time = 300
max-ban-score = 80
ban-reset-time = 1200
cookie-timeout = 300
deny-roaming = false
rekey-time = 172800
rekey-method = ssl
use-occtl = true
pid-file = /run/ocserv.pid
log-level = 1
device = vpns
predictable-ips = true

ipv4-network = 192.168.168.0
ipv4-netmask = 255.255.255.0
tunnel-all-dns = true
dns = 8.8.8.8
dns = 9.9.9.9
ping-leases = false
no-route = 10.0.0.0/8
no-route = 172.16.0.0/12
no-route = 192.168.0.0/16
cisco-client-compat = true
dtls-legacy = true
client-bypass-protocol = false
EOF
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
