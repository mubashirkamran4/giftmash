FROM ruby:3.1.1

WORKDIR /giftmash

RUN apt-get update -qq && apt-get install -y nodejs npm sqlite3

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN chown -R root:root /giftmash

RUN bundle exec rake assets:precompile || true

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

