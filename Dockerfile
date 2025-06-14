FROM caddy:builder AS builder

COPY plugins.txt /plugins.txt

RUN xcaddy build \
  --with $(paste -sd' ' /plugins.txt)

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
