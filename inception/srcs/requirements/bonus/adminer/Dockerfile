FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y php7.4 php7.4-mysql wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
    	mkdir -p /var/www/html && \
	&& mv adminer-4.8.1.php /var/www/html/index.php \
	adduser -u 82 -D -S -G www-data www-data

COPY /conf/www.conf /etc/php8/php-fpm.d/www.conf

EXPOSE 9000
STOPSIGNAL SIGQUIT

CMD ["php-fpm8", "--nodaemonize"]
