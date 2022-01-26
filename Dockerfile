FROM ruby:2.7.3-alpine

RUN apk add --update --no-cache shared-mime-info tzdata yarn nodejs build-base postgresql-dev

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' >> /etc/apk/repositories

RUN apk add --no-cache imagemagick=6.9.6.8-r1 imagemagick-dev=6.9.6.8-r1

RUN gem install bundler -v 2.2.14

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock vendor ./

RUN bundle install

COPY . .

ENTRYPOINT ["./entrypoints/docker_entrypoint.sh"]
