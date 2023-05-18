FROM debian:buster

RUN apt update 
RUN apt install -y nginx 
RUN apt install -y openssl

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/private-key.pem -out /etc/ssl/certs/certificate.pem -days 365 -subj "/C=FR/ST=Paris/L=Paris/O=42"
RUN mkdir -p /var/www/html/wordpress && chmod 777 /var/www/html/wordpress

EXPOSE 443

RUN mkdir -p /var/run/nginx
COPY nginx.conf /etc/nginx/nginx.conf
#COPY nginx.conf /etc/nginx/cond.d
#COPY default /etc/nginx/sites-enabled/
#COPY default /etc/nginx/sites-available/


RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]


