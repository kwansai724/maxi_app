# ECRにプッシュする際のビルドコマンド
# 1. aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 自分のAWSアカウントID.dkr.ecr.ap-northeast-1.amazonaws.com
# 2. docker build --platform=linux/x86_64 -t maxi_app_api .
# 3. docker tag maxi_app_api:latest 自分のAWSアカウントID.dkr.ecr.ap-northeast-1.amazonaws.com/maxi_app_api:latest
# 4. docker push 自分のAWSアカウントID.dkr.ecr.ap-northeast-1.amazonaws.com/maxi_app_api:latest

FROM ruby:3.1
ARG RUBYGEMS_VERSION=3.3.20
RUN mkdir /maxi_app
WORKDIR /maxi_app
COPY Gemfile /maxi_app/Gemfile
COPY Gemfile.lock /maxi_app/Gemfile.lock
RUN bundle install -j 8
COPY . /maxi_app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server"]
