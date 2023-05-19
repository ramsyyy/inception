all:
	mkdir -p /home/raaga/data/wordpress
	mkdir -p /home/raaga/data/mariadb
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down
	sudo rm -rf /home/raaga/data/*
remove:
	
	sudo docker stop wordpress ; \
	sudo docker stop mariadb ; \
	sudo docker stop nginx ; \
	
