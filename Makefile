#!make
.DEFAULT_GOAL=local.start

local.start:
	docker-compose up --build --detach

local.stop:
	docker-compose stop
