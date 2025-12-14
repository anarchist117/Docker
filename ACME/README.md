# ACME
## Create wildcard certificate
### 1. Run acme.sh demon
```bash
docker compose up -d
```
### 2. Get Certificate
```bash
docker exec -it acme.sh  --issue --dns dns_regru -d example.com -d *.example.com --server letsencrypt
```


# Documentation
[acme.sh in docker](https://github.com/acmesh-official/acme.sh/wiki/Run-acme.sh-in-docker)

[reg.ru API](https://github.com/acmesh-official/acme.sh/wiki/dnsapi2#dns_regru)

[ACME server](https://github.com/acmesh-official/acme.sh/wiki/Server)
