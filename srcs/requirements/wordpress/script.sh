sleep 10

wp config create --allow-root \
		--dbname=$DATABASE_NAME \
		--dbuser=$USERNAME \
		--dbpass=$PASSWORD \
		--dbhost=mariadb:3306 --path='var/www/wordpress'

chmod -R 777 /var/www/wordpress

php-fpm7.3 -F