#!/bin/bash

# Declare helpers
get_required_env() {
  local value=${!1:?Error: environment variable $1 is not set}
  echo "${value}"
}

ffmpeg -f pulse \
  -i default \
  -acodec libmp3lame \
  -fflags nobuffer \
  -f flv "$(get_required_env RTMP_SERVER_URL)"