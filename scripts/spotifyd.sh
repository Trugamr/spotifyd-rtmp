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
  --backend pulseaudio \
  --device-name "$(get_env SPOTIFYD_DEVICE_NAME 'Faux')" \
  --device-type "$(get_env SPOTIFYD_DEVICE_TYPE 'avr')" \
  --bitrate "$(get_env SPOTIFYD_BITRATE '320')" \
  --username "$(get_required_env SPOTIFY_USERNAME)" \
  --password "$(get_required_env SPOTIFY_PASSWORD)"
