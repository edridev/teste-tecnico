FROM ruby:3.1.4-alpine3.18

ENV BUNDLER_VERSION=2.4.18

RUN apk add --update --no-cache \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \ 
    linux-headers \
    libxml2-dev \
    libxslt-dev \
    libgcrypt-dev \
    make \
    openssl \
    pkgconfig \
    postgresql-dev \
    tzdata \
    yarn

RUN gem install bundler -v 2.4.18

WORKDIR /rails

ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    DISABLE_DATABASE_ENVIRONMENT_CHECK=1 \
    BUNDLE_WITHOUT="development"


COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install

COPY . .

ENTRYPOINT [ "/rails/bin/docker-entrypoint.sh" ]
