FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs libpq-dev

RUN mkdir /note
WORKDIR /note
COPY Gemfile* /note/
RUN bundle install

ADD . /note

CMD RAILS_ENV=${RAILS_ENV} bundle exec rails db:create db:migrate db:seed && bundle exec rails s -p ${PORT} -b '0.0.0.0'
