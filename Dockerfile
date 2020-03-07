FROM ruby:latest

RUN apt-get update -qq && apt-get install -y nodejs libpq-dev

RUN mkdir /note
WORKDIR /note
COPY Gemfile* /note/
RUN bundle install

ADD . /note

CMD rails s
