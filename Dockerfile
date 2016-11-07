# Use the Latest LTS Ubuntu Version
FROM ubuntu:16.04

# Curl Nonsense to get NodeJS 6.X (LTS) Version
RUN apt-get -yy update && apt-get -yy install curl \
&& (curl -sL https://deb.nodesource.com/setup_6.x | bash -) \
&& apt-get -yy install \
    build-essential \
    git \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev \
    nginx \
    nodejs \
    file \
    libmagickwand-dev \
    libcurl4-openssl-dev \
&& rm -rf /var/lib/apt/lists/*

# Pre-Install the Latest Bundler
RUN gem install bundler

# Set the Working Directory for All Commands that Follow
WORKDIR /app