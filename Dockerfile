FROM php:8.2-fpm-alpine

RUN apk add --no-cache nginx bash

# Configure PHP-FPM to listen on TCP instead of socket
RUN sed -i 's|listen = .*|listen = 127.0.0.1:9000|' /usr/local/etc/php-fpm.d/www.conf

# Remove default nginx config (ignore errors if not present)
RUN rm -f /etc/nginx/conf.d/default.conf || true

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY . /var/www/html/

WORKDIR /var/www/html/

RUN chown -R www-data:www-data /var/www/html

# Render will set $PORT, so expose it dynamically
EXPOSE 8080

# Start both php-fpm and nginx
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
