FROM debian:buster 

RUN apt update && apt install -y php-fpm php7.3 \
    wget curl \
    mariadb-client php-mysqli 

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzf latest.tar.gz;
RUN rm latest.tar.gz


EXPOSE 9000
WORKDIR /var/www/html
ENTRYPOINT ["/bin/sh" ]