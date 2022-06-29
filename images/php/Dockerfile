FROM php:8.1.2-fpm

# ADD and set Group
#RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

# Create folder to run
RUN mkdir -p /var/www
#RUN chown laravel:laravel /var/www

RUN apt-get update && apt-get install -y \
        curl \
        libpq-dev \
        libicu-dev \
        libzip-dev \
        zip \
        git && \
    docker-php-ext-install -j$(nproc) iconv pdo pdo_pgsql pgsql bcmath intl zip && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql  && \
    docker-php-ext-enable pdo_pgsql && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install php-redis
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

# Install Trader PHP Extension
RUN pecl install trader && docker-php-ext-enable trader

WORKDIR /var/www/app

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["php-fpm"]