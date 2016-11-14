# Use the Latest LTS Ubuntu Version
FROM ubuntu:16.04

MAINTAINER HONK Technologies, Inc.

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
    libpq-dev \
    rsyslog \
&& rm -rf /var/lib/apt/lists/*

# Copy our nginx config to the right place
COPY nginx.conf /etc/nginx/nginx.conf

# Port corresponding to the port we send traffic to in our nginx.conf
ENV PORT=5000

# Pre-Install the Latest Bundler and Rails 4.2.X for a quicker bundle install later
# -N disables document generation
RUN gem install bundler -v "~> 1.13" -N
RUN gem install rails -v "~> 4.2" -N

# Set the Working Directory for All Commands that Follow
WORKDIR /app

# Copy Our Default startup script
COPY start.sh bin/

# Set our Default Action
CMD ['bin/start.sh']

# ONBUILD section:
# Copy Gemfile & Gemfile.lock, then run bundle install, then uninstall build-essential to thin out the image
ONBUILD COPY Gemfile .
ONBUILD COPY Gemfile.lock .
ONBUILD RUN bundle install --with=production --without="development test"
ONBUILD RUN apt-get uninstall build-essential