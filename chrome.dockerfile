FROM browserless/chrome:latest
LABEL maintainer="ericdraken@gmail.com"

# Switch back to root
# Then in entrypoint call `su blessuser`
USER root

# UFW
RUN apt-get -qq update
RUN apt-get -y -qq install iptables ufw module-init-tools
RUN apt-get -qq clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose the web-socket and HTTP ports
EXPOSE 3000

ADD chrome/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["dumb-init", "/docker-entrypoint.sh"]
CMD [ "node", "./build/index.js" ]

# Example invocation
# docker build -t secure-browserless .

# docker run \
#    -it \
#    --rm \
#    -e DOCKER_OPTS="--iptables=false" \
#    -e USE_CHROME_STABLE='true' \
#    --cap-add=net_admin \
#    -p 3000:3000 \
#    secure-browserless

# Test
# curl -x localhost:5000 ipinfo.io