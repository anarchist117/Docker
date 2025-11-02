upstream uptime-kuma {
  server 192.168.1.2:3001;
}

server {
  listen 443 ssl;
  server_name           uptime.domain.com;
  include               conf.d/_global.conf;

  location / {
    proxy_pass          http://uptime-kuma;
    proxy_set_header    X-Real-IP $remote_addr;
    proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;    
    proxy_http_version  1.1;
    proxy_set_header    Upgrade $http_upgrade;
    proxy_set_header    Connection "upgrade";
    proxy_set_header    Host $host;
  }
}
