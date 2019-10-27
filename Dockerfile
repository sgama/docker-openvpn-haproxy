FROM alpine:latest
LABEL maintainer="samsongama@gmail.com"

ADD vpn-proxy /app
RUN apk --update --no-cache add privoxy openvpn runit && \
    find /app -name run | xargs chmod u+x

ENV OPENVPN_CONFIG="ca20" \
    OPENVPN_USERNAME="" \
    OPENVPN_PASSWORD="" \
    LOCAL_NETWORK=192.168.1.0/24

EXPOSE 8118

CMD ["runsvdir", "/app"]
