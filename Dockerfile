FROM ruby:2-alpine

WORKDIR /dbmigrate
ADD . /dbmigrate/

RUN apk add -U --no-cache mysql-dev build-base bash && \
    gem install bundler && \
    bundle install

ENTRYPOINT ["bin/dbmigrate"]
