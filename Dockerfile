FROM php:8.2-apache

# Εγκατάσταση των MySQL drivers (PDO και mysqli)
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Ορίζουμε τον σωστό φάκελο εργασίας του Apache
WORKDIR /var/www/html

# Αντιγράφουμε ρητά όλα τα αρχεία από το GitHub repository μέσα στον server
COPY . /var/www/html/

# Δίνουμε τα απαραίτητα δικαιώματα ανάγνωσης στον Apache
RUN chown -R www-data:www-data /var/www/html

# Ρύθμιση του Apache για να ακούει στη δυναμική πόρτα του Render
RUN sed -i 's/Listen 80/Listen ${PORT}/g' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:${PORT}>/g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80
