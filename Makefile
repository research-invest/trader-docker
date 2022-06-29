init: up migrate seed
up:
	docker-compose up -d
recreate-nginx:
	docker-compose up -d --force-recreate --no-deps --build trader-nginx
recreate-site:
	docker-compose up -d --force-recreate --no-deps --build trader-site
recreate-db:
	docker-compose up -d --force-recreate --no-deps --build trader-postgres
migrate:
	docker-compose exec trader-site php artisan migrate --force
migrate-down:
	docker-compose exec trader-site php artisan migrate:rollback --step=1 --force
seed:
	docker-compose exec trader-site php artisan db:seed
exchange-info:
	docker-compose exec trader-site php artisan exchange-info:run
get-orders:
	docker-compose exec trader-site php artisan spot-account-trade-get-orders:run
get-balance:
	docker-compose exec trader-site php artisan spot-account-trade-get-balance:run
gophp:
	docker-compose exec trader-site bash