.DEFAULT_GOAL=help

GO_VERSION?=1.22.0

build: ## build docker image
	docker build \
		--build-arg="GO_VERSION=$(GO_VERSION)" \
		--platform linux/amd64 -t local/webg3n -f Dockerfile .

run: ## run app as container
	@echo "-------------------------------------------"
	@echo "Server running at: http://localhost:8000"
	@echo "-------------------------------------------"
	@echo
	docker run --platform linux/amd64 --name webg3n --rm -p 8000:8000 local/webg3n

stop: ## stop container
	docker container stop webg3n

help:
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ": "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
