FROM php:7.0.31-cli-alpine3.7

RUN curl -L http://static.phpmd.org/php/latest/phpmd.phar > phpmd \
	&& curl -L https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar > php-cs-fixer

ENTRYPOINT [ "php" ]
