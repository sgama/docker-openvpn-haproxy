#!/usr/bin/env bash

UFW_ACTIVE=$(ufw status | grep -qw " active"; echo "$?")
if [[ $UFW_ACTIVE != "0" ]]; then
  # UFW rules
  ufw default allow incoming
  ufw default deny outgoing
  ufw allow out 53
  ufw allow out 5000 # For proxying to HAProxy
  ufw enable
  ufw status
fi

# Drop to a non-priviledged user
su blessuser
exec "$@"