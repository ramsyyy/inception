all:
	#mv ../.env ./srcs/
	
	mkdir -p ${HOME}/data/wordpress
	mkdir -p ${HOME}/data/mariadb
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down
	rm -rf ${HOME}/data

fclean:  stop
	sudo docker system prune -af
