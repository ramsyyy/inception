FROM debian:buster

RUN apt-get update \
	&& apt-get install -y nginx openssl

#RUN mkdir /etc/nginx/ssllllllllllllllllllllllllllll

RUN  openssl req -newkey rsa:4096 -nodes -keyout /etc/ssl/private/cert.key -x509 -days 365 -out /etc/ssl/certs/cert.crt -subj '/CN=FR/C=FR'

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx","-g","daemon off;"]
