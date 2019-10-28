#!/bin/sh
set -e -u -o pipefail

echo "Running OpenVPN UP script"

echo "VPN IP information:"
curl -s -p ipinfo.io/$4
echo