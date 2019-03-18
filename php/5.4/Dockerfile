FROM php-5.4.45-fpm-alpine3.4

WORKDIR /working
ADD ./cphalcon-phalcon-v2.0.8 cphalcon
ADD ./GeoIP.dat   /usr/share/GeoIP/GeoIP.dat
ADD ./GeoIPCity.dat   /usr/share/GeoIP/GeoIPCity.dat


RUN echo 'http://mirrors.aliyun.com/alpine/v3.4/community/'>/etc/apk/repositories \
	&& echo 'http://mirrors.aliyun.com/alpine/v3.4/main/'>>/etc/apk/repositories \
	&& apk upgrade --update && apk add --no-cache $PHPIZE_DEPS \
    git bash tzdata freetype libpng libjpeg-turbo freetype-dev postgresql-dev libpng-dev libjpeg-turbo-dev libxml2-dev libmcrypt libmcrypt-dev autoconf geoip geoip-dev libmemcached libmemcached-dev cyrus-sasl cyrus-sasl-dev gettext gettext-dev \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && docker-php-ext-install pdo pdo_mysql gettext bcmath \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* \
    && pecl install xdebug-2.3.3 mongo geoip memcache memcached-2.2.0 redis \
    && cd cphalcon/build/ \
     && ./install \
    && rm -rf /tmp/* \
    && docker-php-ext-enable mongo geoip memcache memcached redis phalcon xdebug \
    # && cd /usr/share/GeoIP \
    # && wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz \
    # && gunzip GeoLiteCity.dat.gz \
    # && wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz \
    # && gunzip GeoIP.dat.gz \
    # && mv GeoLiteCity.dat GeoIPCity.dat \
    && sed -i "s#^listen = 127.0.0.1:9000.*#listen = 0.0.0.0:9000#g" /usr/local/etc/php-fpm.d/www.conf 
 
       
