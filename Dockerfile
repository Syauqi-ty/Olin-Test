FROM php:7.2-apache
WORKDIR /var/www/html/
COPY . /var/www/html/


RUN chown -R www-data:www-data /var/www/html
USER www-data


EXPOSE 80