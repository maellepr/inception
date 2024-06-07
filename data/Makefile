all: 
	mkdir -p /home/mapoirie/data/mariadb
	mkdir -p /home/mapoirie/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker compose -f ./srcs/docker-compose.yml logs

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/mapoirie/data/mariadb/*
	@sudo rm -rf /home/mapoirie/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean
