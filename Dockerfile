FROM php:8.2-fpm-alpine

# Install nginx and bash
RUN apk add --no-cache nginx bash

# Configure PHP-FPM to listen on TCP
RUN sed -i 's|listen = .*|listen = 127.0.0.1:9000|' /usr/local/etc/php-fpm.d/www.conf

# Copy full nginx.conf to main nginx.conf (NOT conf.d)
COPY nginx.conf /etc/nginx/nginx.conf

# Copy project files
COPY . /var/www/html/

WORKDIR /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 8080

# Start PHP-FPM in background and nginx in foreground
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
