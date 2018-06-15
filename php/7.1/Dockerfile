FROM daocloud.io/library/php:7.1.16-fpm-alpine3.4

WORKDIR /working

RUN echo 'http://mirrors.aliyun.com/alpine/v3.4/community/'>/etc/apk/repositories \
	&& echo 'http://mirrors.aliyun.com/alpine/v3.4/main/'>>/etc/apk/repositories \
	&& apk upgrade --update && apk add --no-cache $PHPIZE_DEPS \
    tzdata freetype libpng libjpeg-turbo freetype-dev postgresql-dev libpng-dev libjpeg-turbo-dev libxml2-dev libmcrypt libmcrypt-dev autoconf \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pdo pdo_mysql bcmath \
    # && pecl install xdebug-2.6.0 \
    # && docker-php-ext-enable xdebug \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* 