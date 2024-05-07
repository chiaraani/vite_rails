FROM ruby:3.3-bookworm

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev
RUN gem install bundler rails

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY docker-rails.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD rails s -b 0.0.0.0