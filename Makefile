.PHONY: dependency-install file-permission

dependency: dependency-install file-permission npm-install
install: app-install dump-autoload

help:
	@echo 'make install -- download dependencies and install'

dependency-install:
	composer install -o --no-dev

npm-install:
	npm install
	npm run dev

app-install:
	php artisan app:install


file-permission:
	chmod -R 777 storage/
	chmod -R 777 bootstrap/cache/
	chmod -R 777 public/


dump-autoload:
	php artisan clear-compiled

