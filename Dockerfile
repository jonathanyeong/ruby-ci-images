FROM ruby:2.7.8

RUN apt-get update && apt-get install -y \
  default-mysql-client \
  build-essential \
  netcat-openbsd \
  git \
  pkg-config \
  default-libmysqlclient-dev \
  libcurl4-openssl-dev \
  imagemagick \
  libmagickwand-dev \
  libmagickcore-dev \
  nodejs

# RUN apt-get update && apt-get install -y \

#   awscli

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install --no-document \
  rubocop:1.56.0 \
  rubocop-rspec:2.8.0 \
  activesupport:5.2.8 \
  rubocop-rails:2.13.2 \
  simplecov:0.21.2 \
  simplecov-cobertura \
  simplecov-buildkite

WORKDIR /app

COPY . /app

ENTRYPOINT ["/bin/bash", "-c"]