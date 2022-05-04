FROM ruby:3.1.1-alpine AS base
RUN apk add --update --no-cache \ 
  build-base \
  sqlite-dev \
  curl \
  git \
  postgresql-dev \
  bash \
  yarn \
  tzdata
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install
COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]