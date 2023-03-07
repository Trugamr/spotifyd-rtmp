#!/bin/bash

# Declare helpers
get_env() {
  local value=${!1:-$2}
  echo "${value}"
}

get_required_env() {
  local value=${!1:?Error: environment variable $1 is not set}
  echo "${value}"
}

# Start spotifyd
/app/spotifyd --no-daemon \
  --backend "$(get_env BACKEND 'pulseaudio')" \
  --device-name "$(get_env DEVICE_NAME 'Faux')" \
  --device-type "$(get_env DEVICE_TYPE 'avr')" \
  --bitrate "$(get_env BITRATE '320')" \
  --username "$(get_required_env USERNAME)" \
  --password "$(get_required_env PASSWORD)"
