FROM php:8.2-apache

# Δημιουργία του index.php απευθείας μέσα στον server με hardcoded κώδικα
RUN echo '<?php echo "<h1>Hello World!</h1><p>PHP is running.</p><p><small>Time of Server: " . date("H:i:s") . "</small></p>"; ?>' > /var/www/html/index.php

# Υποχρεωτικό δικαίωμα ανάγνωσης για τον Apache
RUN chmod 644 /var/www/html/index.php

# Ρύθμιση του Apache για να ακούει στη δυναμική πόρτα του Render
RUN sed -i 's/Listen 80/Listen ${PORT}/g' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:${PORT}>/g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80
