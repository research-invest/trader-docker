init: up migrate seed
up:
	docker-compose up -d
recreate-nginx:
	docker-compose up -d --force-recreate --no-deps --build trader-nginx
recreate-php:
	docker-compose up -d --force-recreate --no-deps --build trader-php
recreate-go:
	docker-compose up -d --force-recreate --no-deps --build trader-go
migrate:
	docker-compose exec trader-php php artisan migrate --force
migrate-down:
	docker-compose exec trader-php php artisan migrate:rollback --step=1 --force
seed:
	docker-compose exec trader-php php artisan db:seed
exchange-info:
	docker-compose exec trader-php php artisan exchange-info:run
get-orders:
	docker-compose exec trader-php php artisan spot-account-trade-get-orders:run
get-balance:
	docker-compose exec trader-php php artisan spot-account-trade-get-balance:run
gophp:
	docker-compose exec trader-php bash
gogo:
	docker-compose exec trader-go sh