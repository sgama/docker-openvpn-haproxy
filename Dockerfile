FROM alpine:latest
LABEL maintainer="samsongama@gmail.com"

ADD vpn-proxy /app
RUN apk --update --no-cache add privoxy openvpn runit && \
    chmod u+x /app/run /app/healthcheck.sh

ENV OPENVPN_CONFIG="ca20" \
    OPENVPN_USERNAME="" \
    OPENVPN_PASSWORD="" \
    LOCAL_NETWORK=192.168.1.0/24

EXPOSE 8118

HEALTHCHECK --start-period=30s --interval=30s --timeout=10s \
  CMD /app/healthcheck.sh

ENTRYPOINT ["runsvdir", "/app"]
