FROM php:5.6.35-fpm-alpine3.4

WORKDIR /working

RUN echo 'http://mirrors.aliyun.com/alpine/v3.4/community/'>/etc/apk/repositories \
	&& echo 'http://mirrors.aliyun.com/alpine/v3.4/main/'>>/etc/apk/repositories \
	&& apk upgrade --update && apk add --no-cache $PHPIZE_DEPS \
    git bash tzdata freetype libpng libjpeg-turbo freetype-dev postgresql-dev libpng-dev libjpeg-turbo-dev libxml2-dev libmcrypt libmcrypt-dev autoconf geoip geoip-dev libmemcached libmemcached-dev cyrus-sasl cyrus-sasl-dev gettext gettext-dev \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd pdo pdo_mysql gettext bcmath mcrypt \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* \
    && pecl install xdebug-2.3.3 mongo geoip memcache memcached-2.2.0 redis \
    && git clone --depth=1 "git://git.coding.net/yuhaibo/mirror-cphalcon.git" \
    && cd mirror-cphalcon/build/ \
    && ./install \
    && rm -rf /tmp/* \
    && docker-php-ext-enable xdebug mongo geoip memcache memcached redis phalcon \
    && cd /usr/share/GeoIP \
    && wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz \
    && gunzip GeoLiteCity.dat.gz \
    && wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz \
    && gunzip GeoIP.dat.gz \
    && mv GeoLiteCity.dat GeoIPCity.dat \
    && sed -i "s#^listen = 127.0.0.1:9000.*#listen = 0.0.0.0:9000#g" /usr/local/etc/php-fpm.d/www.conf 

