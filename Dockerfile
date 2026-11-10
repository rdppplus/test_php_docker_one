# lightweight  PHP with Apache server
FROM php:8.2-apache

# copy files of repository to the Apache folder in serverCOPY . /var/www/html/

# Open port 80 exposing web
EXPOSE 80

# Ρυθμίζουμε τον Apache να ακούει στην πόρτα που του ορίζει δυναμικά το Render
RUN sed -i 's/Listen 80/Listen ${PORT}/g' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:${PORT}>/g' /etc/apache2/sites-available/000-default.conf
