FROM debian:buster 

RUN apt-get -y update  
RUN  apt-get -y  upgrade 
RUN  apt-get install -y php-fpm php7.3 php-mysql
RUN apt-get install  -y wget 
RUN apt-get install -y mariadb-client  

#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
#RUN cd /var/www/ && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN mkdir -p /run/php/
RUN chmod 777 /run/php

#RUN chown -R root:root /var/www/wordpress
COPY ./www.conf /etc/php/7.3/fpm/pool.d/
#COPY ./wp-config.php /var/www/

EXPOSE 9000

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod 777 wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./script.sh ./

ENTRYPOINT ["bash" , "./script.sh"]
