FROM ruby:3.2.2

ARG LANG=C.UTF-8
ARG TZ=Asia/Tokyo

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn vim-tiny default-mysql-client

WORKDIR /rails
COPY . /rails

USER root

RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /usr/local/bundle && \
    chown -R rails:rails db log storage tmp

USER rails:rails
RUN bundle install -j 4

ENTRYPOINT ["/rails/bin/docker-entrypoint-dev"]
EXPOSE 8080

CMD ["rails", "server", "-p", "8080", "-b", "0.0.0.0"]