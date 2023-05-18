#!/bin/bash


mysqld &
PID=$?
sleep 1

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
    echo "Database already installed"
else
    mysql_secure_installation <<_EOF_
$MYSQL_ROOT_PASSWORD
y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
n
y
y
_EOF_
echo "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -uroot
echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
#echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"|  mysql -uroot -p$MYSQL_ROOT_PASSWORD
#echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
#echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
##mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress_db.sql
#echo "Database created"
#
#fi
#
#mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

#echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -uroot
#exec "$@"

kill -9 $PID

exec mysqld
