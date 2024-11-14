#!/bin/sh
certbot "$@" &
crond -f
