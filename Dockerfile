FROM php:8.2-fpm-alpine

# Install nginx and bash
RUN apk add --no-cache nginx bash

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom nginx config (we will create this next)
COPY nginx.conf /etc/nginx/nginx.conf

# Copy all your project files to web root
COPY . /var/www/html/

WORKDIR /var/www/html/

# Fix permissions (optional)
RUN chown -R www-data:www-data /var/www/html

# Expose Render required port
EXPOSE 10000

# Start php-fpm and nginx
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
