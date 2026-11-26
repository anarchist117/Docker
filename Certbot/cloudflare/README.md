# Usage
Create a file with your cloudflare credentials
```
nano ./letsencrypt/cloudflare.ini
```
regru.ini
```
# Cloudflare API token used by Certbot
dns_cloudflare_api_token = 0123456789abcdef0123456789abcdef01234567
```
Change file permissions to be accessible only by root
```
chmod 600 ./letsencrypt/cloudflare.ini
```

# Documentation
https://certbot-dns-cloudflare.readthedocs.io/en/latest/