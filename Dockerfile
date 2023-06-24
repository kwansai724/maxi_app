FROM ruby:3.1
ARG RUBYGEMS_VERSION=3.3.20
RUN mkdir /maxi_app
WORKDIR /maxi_app
COPY Gemfile /maxi_app/Gemfile
COPY Gemfile.lock /maxi_app/Gemfile.lock
RUN bundle install
COPY . /maxi_app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server"]
