FROM ruby:2.7.8

RUN apt-get update && apt-get install -y \
  default-mysql-client \
  netcat-openbsd \
  build-essential \
  imagemagick \
  git \
  libcurl4-openssl-dev \
  libmagickwand-dev \
  libmagickcore-dev \
  pkg-config \
  default-libmysqlclient-dev \
  nodejs \
  awscli

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install --no-document rubocop:1.56.0 rubocop-rspec:2.8.0 activesupport:5.2.8 rubocop-rails:2.13.2
