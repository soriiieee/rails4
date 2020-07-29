FROM ruby:2.5.3

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev node.js

#workdir setting
RUN mkdir /rails4
ENV APP_ROOT /rails4
WORKDIR $APP_ROOT

#Host(local) Gemfile copy into container
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

#Gemfile bundle install
RUN bundle install
ADD . $APP_ROOT

