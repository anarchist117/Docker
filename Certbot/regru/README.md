# Usage
Create a file with your reg.ru credentials
```
nano ./letsencrypt/regru.ini
```
regru.ini
```
certbot_regru:dns_username=test
certbot_regru:dns_password=test
```
Change file permissions to be accessible only by root
```
chmod 600 ./letsencrypt/regru.ini
```

# Documentation
https://hub.docker.com/r/lionur/certbot-dns-regru <br>
https://github.com/free2er/certbot-regru