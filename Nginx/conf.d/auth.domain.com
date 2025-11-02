# https://www.keycloak.org/server/reverseproxy

upstream keycloak {
  server 192.168.1.2:8080;
}

server {
  listen 443 ssl;
  server_name           auth.domain.com;
  include               conf.d/_global.conf;

  location / {
    proxy_pass          http://keycloak;
    proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header    X-Forwarded-Proto https;
    proxy_set_header    X-Forwarded-Port 443;
    proxy_set_header    X-Forwarded-Host $http_host;
    proxy_http_version  1.1;
    proxy_redirect      off;
  }
}
