FROM php:8.3-cli

# Install system dependencies separately
RUN apt-get update && \
    apt-get install -y \
        git \
        zip \
        unzip \
        libpq-dev \
        libzip-dev \
        libonig-dev \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql mbstring zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app

# Install Laravel dependencies
RUN composer install --no-interaction --optimize-autoloader

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
