FROM php:7.0-fpm-alpine

RUN apk update && \
	apk add wget gcc g++ autoconf make mysql-dev

RUN wget https://github.com/phalcon/cphalcon/archive/v3.0.4.zip && \
	unzip v3.0.4.zip && \
	cd cphalcon-3.0.4/build && \
	sed -ie 's/bash/sh/' install && \
	sh install && \
	docker-php-ext-enable phalcon && \
	docker-php-ext-install pdo_mysql
