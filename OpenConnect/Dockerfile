FROM alpine

# https://www.infradead.org/ocserv/download/
ENV OCSERV_VERSION=1.3.0

RUN apk add --update gnutls-dev libseccomp-dev lz4-dev libev-dev linux-pam-dev iptables tini && \
    rm -rf /var/cache/apk/*

EXPOSE 443

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["run.sh"]
