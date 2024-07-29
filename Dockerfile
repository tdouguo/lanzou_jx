FROM php:7.4-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
COPY . /var/www/html/
RUN mkdir -p /var/www/html/favicon && chown -R www-data:www-data /var/www/html/favicon && chmod -R 755 /var/www/html/favicon
EXPOSE 80
CMD ["apache2-foreground"]
