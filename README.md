# Tour de App - Generic boilerplate

Šablona pro vývoj aplikace pro Tour de App obsahující pouze GitHub Action s vytvořením a nahráním výstupu.
Je potřeba přidat Dockerfile, který na základě zdrojového kódu aplikace vytvoří docker image vaší aplikace. 
Aplikace může běžet na libovolném portu zpřístupněném pomocí příkazu `EXPOSE PORT_NUMBER` ve vaší Dockerfile.

## Odevzdání

Jak odevzdat svojí aplikaci můžete najít v našich [vzdělávacích materiálech](https://tourde.app/vzdelavaci-materialy/jak-odevzdavat)
# Laravel Project with Docker

This project includes Laravel 11, MySQL, and Adminer, set up using Docker Compose. It serves as a quick and convenient environment for Laravel application development.

---

## Table of Contents

- [Requirements](#requirements)


- [Development](#development)
  - [Installation (dev)](#installation-dev)
  - [Usage (dev)](#usage)
  - [Services (dev)](#services-dev)
  - [Access Tools (dev)](#access-tools-dev)


- [Production](#production)
  - [Deployment (prod)](#deployment-prod)


- [Notes](#notes)

---

## Requirements

Ensure you have the following installed before running the project:

- [PHP ^8.2](https://www.php.net/downloads.php)
- [Composer](https://getcomposer.org)
- [Node.js](https://nodejs.org)
- [Docker Desktop](https://www.docker.com/)

---

### Installation (dev)

1. Put your code somewhere, open terminal, enter the project directory, and run composer install dependency packages:

```bash
composer install
```

and then run docker containers:

```bash
docker compose -f .docker/dev/docker-compose.yml --env-file .env.dev up -d --build
```

### Usage

1.	Access the Laravel application:
	- URL: http://localhost:8000

2.	Access Adminer:
	- URL: http://localhost:8080
	- Login credentials:
	- System: MySQL
	- Server: mysql
	- Username: laravel
	- Password: laravel

3.	Run migrations:

```bash
docker exec -it laravel-app-dev php artisan migrate
```

4.	Test database connection in Laravel:

```bash
docker exec -it laravel-app-dev php artisan tinker
```

### Services (dev)

1. Laravel (App)
    - Port: 8000
	- Container: laravel-app-dev
2. MySQL
	- Port: 3306
	- Container: laravel-mysql
3. Adminer
	- Port: 8080
	- Container: laravel-adminer

### Access tools (dev)

- Access Laravel container:

```bash
docker exec -it laravel-app-dev bash
```

- Access MySQL container:

```bash
docker exec -it laravel-mysql bash
```

- View logs for Laravel container:

```bash
docker logs laravel-app
```

## Production

### Deployment (prod)

After upload project to server, you need to run the following steps:

1. Change .env file: 

```dotenv
APP_URL=http://localhost # change to your domain
```

2. Change .docker/prod/docker-compose.yml file:

```nginx configuration
server_name yourdomain.com www.yourdomain.com;
```

3. Run the following commands on server:

```bash
docker compose -f .docker/prod/docker-compose.yml up -d --build
```

```bash
docker exec -it laravel-app-prod bash
```

```bash
php artisan migrate
```

4. Your application is now live at your domain.

    - http://yourdomain.com

### Notes

- Adminer is used for quick database management and testing.
- The application is set up for local and production development.
- Ensure all containers are up and running to avoid connectivity issues.
- You can use ssl certificate for production environment.
