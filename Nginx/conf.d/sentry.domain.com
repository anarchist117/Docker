# https://develop.sentry.dev/self-hosted/experimental/reverse-proxy/#nginx

upstream sentry {
  server 192.168.1.3:9000;
}

server {
  listen 443 ssl;
  server_name           sentry.domain.com;
  include               conf.d/_global.conf;

  proxy_buffering       on;
  proxy_buffer_size     128k;
  proxy_buffers         4 256k;

  location / {
    proxy_pass          http://sentry;
  }

  location ~ ^/api/[0-9]+/(envelope|minidump|security|store|unreal)/ {
    proxy_pass          http://sentry;
    add_header          Access-Control-Allow-Origin * always;
    add_header          Access-Control-Allow-Credentials false always;
    add_header          Access-Control-Allow-Methods GET,POST,PUT always;
    add_header          Access-Control-Allow-Headers sentry-trace,baggage always;
    add_header          Access-Control-Expose-Headers sentry-trace,headers always;
  }
}
