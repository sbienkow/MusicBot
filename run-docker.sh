#!/usr/bin/env bash

docker run -d --name MusicBot --mount "type=bind,src=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/config,dst=/usr/src/musicbot/config" musicbot
