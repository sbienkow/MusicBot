#!/usr/bin/env bash

docker build -f "${MUSICDOCKER:-Ubuntu.Dockerfile}" -t musicbot .
