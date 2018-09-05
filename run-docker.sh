#!/usr/bin/env bash
: "${MUSICCONFIG:=$HOME/docker/binds/musicbot}"

if ! [ "$(ls -A "$MUSICCONFIG" &> /dev/null)" ]; then # If MUSICCONFIG dir is empty
    mkdir -p "$MUSICCONFIG"
    cp -r "$(dirname "$BASH_SOURCE")/config/" "$MUSICCONFIG/config/"  # Copy default config
fi
docker run -d --name MusicBot --mount "type=bind,src=$MUSICCONFIG/config,dst=/usr/src/musicbot/config" musicbot
