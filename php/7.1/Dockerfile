FROM php:7.1.16-fpm-alpine3.4

WORKDIR /working

RUN echo 'http://mirrors.aliyun.com/alpine/v3.4/community/'>/etc/apk/repositories \
	&& echo 'http://mirrors.aliyun.com/alpine/v3.4/main/'>>/etc/apk/repositories \
	&& apk upgrade --update && apk add --no-cache $PHPIZE_DEPS \
    tzdata freetype libpng libjpeg-turbo freetype-dev postgresql-dev libpng-dev libjpeg-turbo-dev libxml2-dev libmcrypt libmcrypt-dev autoconf \
    && wget http://mirrors.hust.edu.cn/apache/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz \
    && tar xzvf /working/zookeeper-3.4.10.tar.gz -C /working  \
    && cd /working/zookeeper-3.4.10/src/c/   \
    && ./configure --prefix=/usr/local/zookeeper   \
    && make && make install \
    && cd /working  \
    && wget http://pecl.php.net/get/zookeeper-0.5.0.tgz \
    && tar xzvf /working/zookeeper-0.5.0.tgz -C /working  \
    && cd /working/zookeeper-0.5.0/   \
    && phpize   \
    && ./configure --with-php-config=/usr/local/bin/php-config --with-libzookeeper-dir=/usr/local/zookeeper   \
    && make    \
    && make install \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pdo pdo_mysql bcmath \
    && pecl install xdebug-2.6.0 mongodb \
    && docker-php-ext-enable xdebug mongodb zookeeper\
    && apk del tzdata \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*  \
    && rm -rf /working/*