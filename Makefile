all:
	mkdir -p /home/ramsy/data/wordpress
	mkdir -p /home/ramsy/data/mariadb
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down

remove:
	
	sudo docker stop srcs_wordpress ; \
	sudo docker stop srcs_mariadb ; \
	sudo docker stop srcs_nginx ; \
	