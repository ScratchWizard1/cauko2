#!/bin/bash

echo "Waiting for MySQL..."
while ! nc -z mysql 3306; do
  sleep 1
done

docker compose -f ňdocker-compose.yml up -d --build
docker exec -it laravel-app-prod bash
php artisan migrate --force
#php artisan serve --host=0.0.0.0 --port=8000
