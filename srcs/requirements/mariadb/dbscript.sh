
#!/bin/sh
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

mysqld &
while !(mysqladmin ping > /dev/null)
do
echo "Waiting for database to be ready..." 
    sleep 5
done
echo "Database is ready"


mysql -uroot -p$DB_ROOT -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';"
mysql -uroot -p$DB_ROOT -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -uroot -p$DB_ROOT -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -uroot -p$DB_ROOT -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -uroot -p$DB_ROOT -e "FLUSH PRIVILEGES;"

mysqladmin -uroot -p$DB_ROOT shutdown

echo "Database already created"

exec mysqld 
