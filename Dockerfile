FROM caddy:builder AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/WeidiDeng/caddy-cloudflare-ip \
  --with github.com/caddyserver/ntlm-transport \
  --with github.com/caddyserver/replace-response \
  --with github.com/greenpau/caddy-security \
  --with github.com/caddyserver/transform-encoder \
  --with github.com/caddyserver/nginx-adapter \
  --with github.com/mholt/caddy-ratelimit \
  --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
  --with github.com/invzhi/caddy-docker-upstreams \
  --with github.com/caddyserver/caddy/v2/modules/caddy-dynamicdns \
  --with github.com/sabliersystems/caddy-sablier \
  --with github.com/max0ne/crowdsec-caddy-bouncer \
  --with github.com/greenpau/caddy-admin-ui \
  --with github.com/gamalan/caddy-tlsredis \
  --with github.com/max0ne/caddy-maxmind-geolocation \
  --with github.com/corazawaf/caddy-coraza \
  --with github.com/caddyserver/caddy/v2/modules/caddy-websockify \
  --with github.com/caddyserver/caddy/v2/modules/l4

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
