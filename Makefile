help:
	@echo "docker-compose commands:"
	@echo "    make build:          Build docker images"
	@echo "    make up:             Run containers"
	@echo "    make upd:            Run containers in the background"
	@echo "    make shell:          Run shell in app's server"
	@echo "    make ror-console:    Run RoR console in application context"
	@echo "    make down:           Stops containers and removes containers created by up"
	@echo "    make prune:          Clean local docker"

build:
	docker compose build


upd:
	docker compose up -d


up:
	docker compose up


api:
	docker compose run --service-ports api


command:
	docker compose run --rm api rails console ${command}


shell:
	docker compose run --rm api bash


ror-console:
	docker compose run --rm api rails console


migrate:
	docker compose run --rm api bash -c "bin/rails db:create db:migrate"



down:
	docker compose down


prune:
	docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker system prune
