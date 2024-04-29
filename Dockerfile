FROM ruby:3.3.0-alpine

ENV APP_PATH /app

RUN mkdir -p $APP_PATH

WORKDIR $APP_PATH

RUN apk add --no-cache --update build-base \
  nano \
  linux-headers \
  git \
  postgresql-dev \
  nodejs \
  bash \
  tzdata \
  gcompat \
  mariadb-dev \
  libffi-dev \
  yaml-dev \
  zlib-dev \
  curl-dev \
  gnupg \
  less

COPY Gemfile $APP_PATH
COPY Gemfile.lock $APP_PATH

RUN bundle install

COPY . $APP_PATH

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

