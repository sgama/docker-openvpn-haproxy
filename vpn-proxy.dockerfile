FROM alpine:latest
LABEL maintainer="samsongama@gmail.com"

ADD vpn-proxy /app
RUN apk --update --no-cache add privoxy openvpn runit curl && \
    find /app -type f -name run | xargs chmod u+x && \
    find /app -type f -name "*.sh" | xargs chmod u+x

ENV LOCAL_NETWORK=192.168.1.0/24 \
    CONFIGDIR="/app/openvpn"

EXPOSE 8118

HEALTHCHECK --start-period=30s --interval=30s --timeout=10s \
  CMD /app/healthcheck.sh

CMD ["runsvdir", "/app"]

