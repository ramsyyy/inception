sleep 10


wp core download --allow-root --path="/var/www/wordpress"

wp config create --allow-root --dbname="database_name" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost=mariadb:3306 --path='/var/www/wordpress'


wp core install	--allow-root\
			--admin_user="$ADMIN_USER"\
			--admin_password="$ADMIN_PASS"\
			--admin_email="$ADMIN_USER@example.com"\
			--url="$DOMAINE_NAME"\
			--title="Inception"\
			--skip-email \
			--path="/var/www/wordpress"


wp user create	--allow-root\
			"$WP_USER"\
			"$WP_USER"@example.com\
			--role=author\
			--user_pass="$WP_PASS"\
			--path="/var/www/wordpress"


chmod -R 777 /var/www/wordpress


php-fpm7.3 -F
