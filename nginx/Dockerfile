# ECRにプッシュする際のビルドコマンド
# 1. aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 自分のAWSアカウントID.dkr.ecr.ap-northeast-1.amazonaws.com
# 2. docker build -f nginx/Dockerfile --build-arg ENVIRONMENT=prd --platform=linux/x86_64 -t maxi_app_nginx .
# 3. docker tag maxi_app_nginx:latest 自分のAWSアカウントID.dkr.ecr.ap-northeast-1.amazonaws.com/maxi_app_nginx:latest
# 4. docker push 自分のAWSアカウントID.dkr.ecr.ap-northeast-1.amazonaws.com/maxi_app_nginx:latest

FROM nginx:latest

# デフォルトで用意されている個別設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*

ARG ENVIRONMENT

ENV TZ Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone \
      && dpkg-reconfigure -f noninteractive tzdata

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/conf.d/${ENVIRONMENT}.conf /etc/nginx/conf.d/maxi_app.conf

# Nginxをforeground起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

EXPOSE 80
