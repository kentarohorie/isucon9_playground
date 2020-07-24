# vi: set ft=Dockerfile :

FROM ruby:2.7.1

ENV LANG C.UTF-8
ENV TZ=Asia/Tokyo

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                        libpq-dev |
                        default-mysql-client

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install -j `nproc`

COPY . $APP_ROOT
