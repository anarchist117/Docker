# ACME
## Create wildcard certificate
### 1. Change default CA to Lets Encrypt
https://community.letsencrypt.org/t/the-acme-sh-will-change-default-ca-to-zerossl-on-august-1st-2021/144052
```bash
acme.sh  --set-default-ca  --server  letsencrypt
```
### 2. Get Certificate
```bash
acme.sh  --issue --dns dns_regru -d example.com -d *.example.com
```
### 3. Run acme.sh demon
```bash
docker compose up -d
```

# Documentation
[acme.sh](https://github.com/acmesh-official/acme.sh)

[acme.sh in docker](https://github.com/acmesh-official/acme.sh/wiki/Run-acme.sh-in-docker)

[reg.ru API](https://github.com/acmesh-official/acme.sh/wiki/dnsapi2#dns_regru)
