
LOGIN_USERNAME=$(shell echo "$DOCKER_LOGIN_USERNAME")
LOGIN_PASSWORD=$(shell echo "$DOCKER_LOGIN_PASSWORD")
CACHED=$(TAG)

.PHONY: build deploy ci

default: build

build:
	@echo "building arch"
	@cd arch && ./build $(TAG)
	@echo "building void"
	@cd void && ./build $(TAG)
	@echo "building debian"
	@cd debian && ./build $(TAG)
deploy:
	@echo "logging into docker"
	@docker login -u $(LOGIN_USERNAME) -p $(LOGIN_PASSWORD)
	@echo "deplying arch"
	@cd arch && ./deploy $(TAG)
	@echo "deplying void"
	@cd void && ./deploy $(TAG)
	@echo "deplying debian"
	@cd debian && ./deply $(TAG)
ci: build deploy