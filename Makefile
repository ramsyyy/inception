all:
	#mv ../.env ./srcs/
	mkdir -p /home/raaga/data/wordpress
	mkdir -p /home/raaga/data/mariadb
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down
	sudo rm -rf /home/raaga/data/*

fclean:  stop
	sudo docker system prune -af
	sudo docker volume rm -f $$(docker volume ls -q)	
