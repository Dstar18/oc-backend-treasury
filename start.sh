#!/bin/sh

# Exit jika ada error
set -e

# Pastikan permission benar untuk storage & bootstrap/cache
chown -R www-data:www-data /var/www/project/storage /var/www/project/bootstrap/cache
chmod -R 775 /var/www/project/storage /var/www/project/bootstrap/cache

# Start PHP-FPM
echo "Starting PHP-FPM..."
php-fpm -D

# Start Nginx (foreground)
echo "Starting Nginx..."
nginx -g "daemon off;"
