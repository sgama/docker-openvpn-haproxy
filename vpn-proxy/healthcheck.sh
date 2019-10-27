#!/bin/ash

tunnel_adapter_count="$(ip -4 a | grep -c tun.$)"
tunnel_adapter_ip="$(ip a | grep tun.$ | awk '{print $2}')"

if [ "${tunnel_adapter_count}" -ne 1 ]; then
   echo "Tunnel adapter fault"
   exit 1
elif [ $(traceroute -m 1 "${tunnel_adapter_ip}" | grep -c "${tunnel_adapter_ip}") -ne 2 ]; then
   echo "Incorrect route"
   exit 1
fi