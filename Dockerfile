ARG CADDY_VERSION=2.10.0
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/invzhi/caddy-docker-upstreams \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/caddyserver/ntlm-transport \
    --with github.com/caddyserver/replace-response \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddyserver/nginx-adapter \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/invzhi/caddy-docker-upstreams \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/max0ne/crowdsec-caddy-bouncer \
    --with github.com/greenpau/caddy-admin-ui \
    --with github.com/gamalan/caddy-tlsredis \
    --with github.com/max0ne/caddy-maxmind-geolocation 


FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
