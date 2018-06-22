
FROM php:7.2.6-cli-alpine3.6


WORKDIR /working

RUN echo 'http://mirrors.aliyun.com/alpine/v3.6/community/'>/etc/apk/repositories \
	&& echo 'http://mirrors.aliyun.com/alpine/v3.6/main/'>>/etc/apk/repositories \
    && apk upgrade --update \ 
    && apk add --no-cache $PHPIZE_DEPS \
    && apk add --no-cache --virtual .phpize-deps linux-headers  \
    && apk add tzdata freetype libpng libjpeg-turbo freetype-dev postgresql-dev libpng-dev libjpeg-turbo-dev libxml2-dev libmcrypt libmcrypt-dev autoconf \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install json xml  phar opcache zip iconv  dom pcntl \
    && pecl install swoole  \
    && docker-php-ext-enable swoole \
    && apk del tzdata \
    && apk del .phpize-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* 