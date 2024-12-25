#!/bin/bash
set -e

echo "Deployment started ..."

# Pull the latest version of the app
git pull origin master

# Install composer dependencies
composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# Recreate cache
php artisan optimize

npm install

# Compile npm assets
npm run prod

# Run database migrations
php artisan migrate --force

echo "Deployment finished!"
