# Użyj oficjalnego obrazu PHP z Apache
FROM php:7.4-apache

# Instalacja potrzebnych narzędzi i rozszerzeń PHP
RUN apt-get update && apt-get install -y \
        git \
        unzip \
        && docker-php-ext-install pdo_mysql

# Pobierz i zainstaluj Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Kopiuj pliki źródłowe aplikacji do katalogu /var/www/html wewnątrz kontenera
COPY . /var/www/html/

# Nadaj odpowiednie prawa dostępu
RUN chown -R www-data:www-data /var/www/html
