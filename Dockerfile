# Base image PHP 8.3 CLI
FROM php:8.3-cli

# Install dependencies Laravel + ekstensi PHP
RUN apt-get update && apt-get install -y \
    librdkafka-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-install pdo pdo_mysql zip \
    && pecl install rdkafka \
    && echo "extension=rdkafka.so" > /usr/local/etc/php/conf.d/rdkafka.ini \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/project

# Copy source code Laravel
COPY . /var/www/project

# Install dependencies Laravel
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Set permission untuk storage & cache
RUN chown -R www-data:www-data /var/www/project/storage /var/www/project/bootstrap/cache \
    && chmod -R 775 /var/www/project/storage /var/www/project/bootstrap/cache

# Expose port Laravel
EXPOSE 8041

# Jalankan Laravel langsung
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8041"]
