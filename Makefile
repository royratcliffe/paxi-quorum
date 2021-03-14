STACK = paxi-quorum
SCALE = 5

.PHONY: build up deploy ps rm services scale

build:
	docker-compose build

up:
	docker-compose up --build

deploy:
	docker stack deploy -c docker-compose.prod.yml $(STACK)

ps:
	docker stack ps $(STACK)

rm:
	docker stack rm $(STACK)

services:
	docker stack services $(STACK)

scale:
	docker service scale $(STACK)_paxi-node=${SCALE}
