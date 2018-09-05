#!/usr/bin/env bash

docker run -d --name MusicBot --mount "type=bind,src=$(dirname "$BASH_SOURCE")/config,dst=/usr/src/musicbot/config" musicbot
