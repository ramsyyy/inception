FROM debian:buster

RUN apt-get update \
	&& apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["nginx","-g","daemon off;"]
