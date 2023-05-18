sleep 10


wp core download --allow-root --path="/var/www/wordpress"
#cd /var/www/wordpress; mv wp-config-sample.php wp-config.php

wp config create --allow-root \
		--dbname=$DATABASE_NAME \
		--dbuser=$USERNAME \
		--dbpass=$PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/wordpress'

echo "jsui la "

wp core install	--allow-root\
			--admin_user="$ADMIN_USER"\
			--admin_password="$ADMIN_PASS"\
			--admin_email="$ADMIN_USER@example.com"\
			--url="$DOMAIN_NAME"\
			--title="Inception"\
			--skip-email\
			--path="/var/www/wordpress"

echo "et la "

wp user create	--allow-root\
			"$WP_USER"\
			"$WP_USER"@example.com\
			--role=author\
			--user_pass="$WP_PASS"\
			--path="/var/www/wordpress"


chmod -R 777 /var/www/wordpress


php-fpm7.3 -F
