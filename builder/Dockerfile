# Use the official PHP image as the base image
FROM php:8.3.10-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    # build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    libzip-dev \
    libsqlite3-dev \
    zip unzip git curl vim nodejs npm \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql pdo_sqlite mbstring xml zip bcmath \
    && docker-php-ext-enable pdo_sqlite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# RUN apt-get clean && rm -rf /var/lib/apt/lists/*
COPY . /var/www

# Check if composer.json exists and no vendor directory, then run commands accordingly
RUN if [ -f /var/www/composer.json ] && [ ! -d /var/www/vendor ]; then \
        echo "composer.json found but no vendors. Running composer install..."; \
        composer install --no-interaction --prefer-dist --optimize-autoloader; \
        npm run build; \
    else \
        echo "No composer.json found or vendor directory already exists. Skipping composer install."; \
    fi

# Set file permissions
RUN chown -R www-data:www-data /var/www

# Copy the entrypoint script to the container
COPY ./builder/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Run the entrypoint script
ENTRYPOINT ["docker-entrypoint.sh"]

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
