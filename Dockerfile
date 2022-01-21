FROM ruby:2.7.3-alpine

RUN apk add --update --no-cache shared-mime-info tzdata yarn nodejs build-base postgresql-dev

RUN gem install bundler -v 2.2.14

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock vendor ./

RUN bundle install

COPY . .

ENTRYPOINT ["./entrypoints/docker_entrypoint.sh"]
