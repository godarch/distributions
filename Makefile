
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
	@echo "building ubuntu cosmic"
	@cd ubuntu/cosmic && ./build $(TAG)
	@echo "building ubuntu disco"
	@cd ubuntu/disco && ./build $(TAG)
deploy:
	@echo "logging into docker"
	@docker login -u $(LOGIN_USERNAME) -p $(LOGIN_PASSWORD)
	@echo "deplying arch"
	@cd arch && ./deploy $(TAG)
	@echo "deplying void"
	@cd void && ./deploy $(TAG)
	@echo "deplying debian"
	@cd debian && ./deploy $(TAG)
	@echo "deplying ubuntu cosmic"
	@cd ubuntu/cosmic && ./deploy $(TAG)
	@echo "deplying ubuntu disco"
	@cd ubuntu/disco && ./deploy $(TAG)
ci: build deploy