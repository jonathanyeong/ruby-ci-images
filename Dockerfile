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
  nodejs \
  awscli \
  libyaml-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install --no-document \
  bundler:2.4.22 \
  rubocop:1.56.0 \
  rubocop-rspec:2.8.0 \
  activesupport:5.2.8 \
  rubocop-rails:2.13.2 \
  simplecov:0.21.2 \
  simplecov-cobertura \
  simplecov-buildkite

WORKDIR /app

RUN ARCH=$(uname -m); \
  if [ "$ARCH" = "x86_64" ]; then \
  curl -L https://github.com/buildkite/test-splitter/releases/download/v0.8.0/test-splitter_0.8.0_linux_amd64 -o /usr/local/bin/test-splitter; \
  elif [ "$ARCH" = "aarch64" ]; then \
  curl -L https://github.com/buildkite/test-splitter/releases/download/v0.8.0/test-splitter_0.8.0_linux_arm64 -o /usr/local/bin/test-splitter; \
  fi && \
  chmod +x /usr/local/bin/test-splitter


COPY . /app

ENTRYPOINT ["/bin/bash", "-c"]