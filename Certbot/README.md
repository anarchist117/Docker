# 1. Edit compose.yml
```
entrypoint: certbot/certbot certonly --standalone -d **test.domain.com** -m **admin@domain.com** --non-interactive --agree-tos
```

# 2. Run Compose
```
docker compose up -d
```

# Documentation
https://eff-certbot.readthedocs.io/en/stable/install.html

https://eff-certbot.readthedocs.io/en/stable/using.html

https://eff-certbot.readthedocs.io/en/stable/man/certbot.html
