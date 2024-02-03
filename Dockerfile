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

# Nadaj odpowiednie prawa dostępu dla wszystkich plików
RUN chown -R www-data:www-data /var/www/html

# Ustaw public jako DocumentRoot
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Konfiguracja Apache, aby używała nowego DocumentRoot
RUN sed -i -e 's|/var/www/html|${APACHE_DOCUMENT_ROOT}|g' /etc/apache2/sites-available/000-default.conf
RUN sed -i -e 's|/var/www/|${APACHE_DOCUMENT_ROOT}|g' /etc/apache2/apache2.conf

# Odblokuj mod_rewrite dla Apache
RUN a2enmod rewrite

# Przejdź do katalogu z aplikacją i zainstaluj zależności za pomocą Composera
WORKDIR /var/www/html
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Upewnij się, że Apache jest skonfigurowany do zapisywania logów przez stdout i stderr
# To umożliwi wyświetlanie logów Apache przy pomocy 'docker logs'
RUN ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log
