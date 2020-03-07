FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs libpq-dev
RUN gem install bundler -v 2.1.4
RUN mkdir /note
WORKDIR /note
COPY Gemfile* /note/
RUN bundle install

ADD . /note

CMD rails s
