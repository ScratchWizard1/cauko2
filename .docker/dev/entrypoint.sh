#!/bin/bash

echo "Waiting for MySQL..."
while ! nc -z mysql 3306; do
  sleep 1
done

php artisan migrate --force
php artisan serve --host=0.0.0.0 --port=8000
