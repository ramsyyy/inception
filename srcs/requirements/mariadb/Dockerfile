FROM debian:buster 

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client
RUN apt-get install -y procps



COPY ./50-servers.cnf /etc/mysql/mariadb.conf.d/50-servers.cnf

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 777 /var/run/mysqld/
RUN chown -R mysql:mysql /var/lib/mysql/
RUN chmod -R 777 /var/lib/mysql/

EXPOSE 3306

COPY dbscript.sh ./
RUN chmod 777 ./dbscript.sh

ENTRYPOINT ["bash", "./dbscript.sh"]

