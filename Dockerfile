# Dockerfile

# Node.js 이미지를 사용하여 Vite 개발 환경 구축
FROM node:14 AS frontend

# WORKDIR /app

# 프로젝트 종속성 설치
# COPY ./package.json ./package-lock.json /app/
# RUN npm install

# Vite 프로젝트 복사
# COPY ./vite.config.js /app/vite.config.js
# COPY ./resources /app/resources

# 빌드 실행
# RUN npm run build

# PHP 이미지를 기반으로 Laravel 애플리케이션 구축
FROM php:8.1-fpm

WORKDIR /var/www/html

ENV DEBIAN_FRONTEND=noninteractive

# 필요한 PHP 확장 설치
# RUN apt-get update && apt-get install -y \
#     libzip-dev \
#     zip

# RUN docker-php-ext-configure zip && \
#     docker-php-ext-install zip pdo pdo_mysql

########## Node.js 설치 (node v16.20.2, npm 8.19.4) ##########
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN apt-get update
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

EXPOSE 8000 8001
