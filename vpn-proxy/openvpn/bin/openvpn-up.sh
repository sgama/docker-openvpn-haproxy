#!/bin/sh
set -e -u -o pipefail

echo "Running OpenVPN UP script"

echo "VPN IP information:"
curl -s -p "${EXIT_NODE_INFO_URL:-https://ipinfo.io/}"
echo
echo