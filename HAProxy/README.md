# HAProxy
https://hub.docker.com/_/haproxy

### Test the configuration file
```bash
docker run -it --rm --name haproxy-syntax-check my-haproxy haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg
```
