FROM alpine:latest
LABEL maintainer="samsongama@gmail.com"

ADD vpn-proxy /app
RUN apk --update --no-cache add privoxy openvpn runit && \
    chmod u+x /app/healthcheck.sh && \
    find /app -name run | xargs chmod u+x

ENV OPENVPN_FILE="ca20" \
    OPENVPN_USERNAME="" \
    OPENVPN_PASSWORD="" \
    LOCAL_NETWORK=192.168.1.0/24 \
    CONFIGDIR="/app/ovpn"

EXPOSE 8118

HEALTHCHECK --start-period=30s --interval=30s --timeout=10s \
  CMD /app/healthcheck.sh

CMD ["runsvdir", "/app"]

