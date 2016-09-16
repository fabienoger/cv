FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /rails_app
WORKDIR /rails_app
ADD Gemfile Gemfile
ADD Gemfile.lock /rails_app/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /rails_app
