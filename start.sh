#!/bin/bash

# Decalare helpers
get_env() {
  # Usave: get_env VARIABLE_NAME DEFAULT_VALUE
  local value=${!1:-$2}
  echo "${value}"
}

get_required_env() {
  local value=${!1:?Error: environment variable $1 is not set}
  echo "${value}"
}

# Start the pulseaudio server
pulseaudio -D --exit-idle-time=-1

# Load the virtual sink and set it as default
pacmd load-module module-virtual-sink sink_name=v1
pacmd set-default-sink v1

# Set the monitor of v1 sink to be the default source
pacmd set-default-source v1.monitor

# Start spotifyd
/app/spotifyd --no-daemon \
  --backend "$(get_env BACKEND 'pulseaudio')" \
  --device-name "$(get_env DEVICE_NAME 'Faux')" \
  --device-type "$(get_env DEVICE_TYPE 'avr')" \
  --bitrate "$(get_env BITRATE '320')" \
  --username "$(get_required_env USERNAME)" \
  --password "$(get_required_env PASSWORD)"
