FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  ca-certificates \
  ffmpeg \
  opus-tools \
  python3 \
  libsodium-dev

# Install build dependencies
RUN apt-get install -y --no-install-recommends \
  gcc \
  git \
  libffi-dev \
  make \
  musl-dev \
  python3-dev \
  python3-pip \
  python3-setuptools

# Clean some info to reduce docker size
RUN apt-get autoclean && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/musicbot
# Copy just requirements to make use of docker-caching
COPY ./requirements.txt ./

# Install pip dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the sources
COPY . ./

# Create volume for mapping the config
VOLUME /usr/src/musicbot/config

ENV APP_ENV=docker

ENTRYPOINT ["python3", "run.py"]
