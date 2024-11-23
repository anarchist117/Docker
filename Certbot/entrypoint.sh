#!/bin/sh
certbot certonly --standalone -d $Domain -m $Email --non-interactive --agree-tos &&
crond -f
