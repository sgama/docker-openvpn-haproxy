# docker-openvpn-haproxy

1) Copy the `.env.tmpl` to `.env` and populate the variables. Variables in parenthesis are the default values.

2) Run `docker-compose up`.

3) Navigate in a browser to the Docker host IP at port 3000. e.g. `http://localhost:3000`. 

4) Metrics from HAProxy are at `host:$STATS_PORT/metrics`.