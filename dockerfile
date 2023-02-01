FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libfreetype6-dev \
    nano \
    wget \
    curl \
    git

RUN docker-php-ext-install pdo_mysql mbstring tokenizer
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/app

COPY . .

EXPOSE 8000

CMD ["php-fpm"]
