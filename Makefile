include .env.development
export $(shell sed 's/=.*//' .env.development)

build:
	docker-compose -f docker-compose.yml build --build-arg BASE_IMAGE=$(API_BASE_IMAGE) --build-arg API_PORT=$(API_PORT) $(opts)

rspec:
	bundle exec rspec --profile

rubocop:
	bundle exec rubocop -a

server:
	bundle exec rails s -p $(API_PORT) -b 0.0.0.0

shell:
	docker exec -it curex_api zsh

up:
	docker-compose -f docker-compose.yml run --service-ports --name curex_api api zsh; docker-compose -f docker-compose.yml down
