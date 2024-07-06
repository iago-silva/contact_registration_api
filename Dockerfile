FROM ruby:3.1.0

RUN apt update && apt install -y build-essential libcurl4-openssl-dev shared-mime-info

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY entrypoint.sh entrypoint.sh

RUN chmod +x ./entrypoint.sh

RUN gem install bundler

RUN bundle config timeout 240

RUN bundle config set path 'vendor/bundle'

RUN bundle install 
