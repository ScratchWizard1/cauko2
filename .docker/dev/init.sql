CREATE USER 'laravel'@'%' IDENTIFIED BY 'laravel';
GRANT ALL PRIVILEGES ON laravel.* TO 'laravel'@'%';
FLUSH PRIVILEGES;
