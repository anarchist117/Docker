```
docker run -it --rm --name certbot \
           -p 80:80 \
           -v "./letsencrypt:/etc/letsencrypt" \
            certbot/certbot certonly --standalone -d test.domain.com -m admin@domain.com --agree-tos
```

# Documentation
https://eff-certbot.readthedocs.io/en/stable/install.html

https://eff-certbot.readthedocs.io/en/stable/using.html

https://eff-certbot.readthedocs.io/en/stable/man/certbot.html
