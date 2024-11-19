#!/bin/bash

if [[ -f /etc/ocserv/users.txt && -f /etc/ocserv/passwd ]]; then
  while IFS= read -r line; do
    user="$(echo "$line" | cut -d':' -f1)"
    if ! grep -q "^$user" "/etc/ocserv/users.txt"; then
      ocpasswd -c /etc/ocserv/passwd -d "$user"
      rm /etc/ocserv/users/"$user.p12"
      echo "Deleted $user"
    fi
  done < /etc/ocserv/passwd
fi

if [ -f /etc/ocserv/users.txt ]; then
  cd /etc/ocserv/ssl
  while IFS= read -r user; do
    if ! grep -q "^$user" "/etc/ocserv/passwd" 2> /dev/null; then
      yes "$user" | ocpasswd -c /etc/ocserv/passwd "$user"
      sed -i "s/^cn =.*/cn = \"$user\"/" "/etc/ocserv/ssl/user.tmpl"
      sed -i "s/^uid =.*/uid = \"$user\"/" "/etc/ocserv/ssl/user.tmpl"
      certtool --generate-privkey --outfile user.key > /dev/null 2>&1
      certtool --generate-certificate --load-ca-certificate ca.pem --load-ca-privkey ca.key --template user.tmpl --load-privkey user.key --outfile user.pem > /dev/null 2>&1
      yes "$user" | certtool --to-p12 --load-certificate user.pem --load-privkey user.key --pkcs-cipher 3des-pkcs12 --outfile /etc/ocserv/users/"$user.p12" --outder > /dev/null 2>&1
      echo "Created $user"
    fi
  done < /etc/ocserv/users.txt
else
  echo "Not found ocserv/users.txt"
fi
