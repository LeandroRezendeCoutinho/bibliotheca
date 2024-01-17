# syntax = docker/dockerfile:1
FROM ruby:3.3.0-alpine as development

# Rails app lives here
WORKDIR /rails

RUN apk --update add --no-cache \
    build-base \
    git \
    postgresql-dev \
    postgresql-client \
    vips-dev \
    tzdata \
    curl

COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

RUN bundle exec bootsnap precompile app/ lib/

RUN adduser -D -h /home/rails -s /bin/sh rails && \
    chown -R rails:rails db log storage tmp

USER rails:rails

EXPOSE 3000

# Start the server
CMD ["./bin/rails", "server"]
