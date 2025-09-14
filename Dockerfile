FROM php:8.2-fpm-alpine

RUN apk add --no-cache nginx bash

# No need to remove non-existing default.conf, so just ignore error
RUN rm /etc/nginx/conf.d/default.conf || true

COPY nginx.conf /etc/nginx/nginx.conf

COPY . /var/www/html/

WORKDIR /var/www/html/

RUN chown -R www-data:www-data /var/www/html

EXPOSE 10000

CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]

