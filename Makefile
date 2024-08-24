.DEFAULT_GOAL=help

GO_VERSION?=1.22.0

# ------------------ [OPTION 1]: Run service inside docker container -----------------------

build: ## build docker image
	docker build \
		--build-arg="GO_VERSION=$(GO_VERSION)" \
		--platform linux/amd64 -t local/webg3n -f Dockerfile .

run: ## run app inside docker container
	@echo "-------------------------------------------"
	@echo "Server running at: http://localhost:8000"
	@echo "-------------------------------------------"
	@echo
	docker run --platform linux/amd64 --name webg3n --rm -p 8000:8000 local/webg3n

stop: ## stop docker container
	docker container stop webg3n

# -------------------- [OPTION 2]: Run service inside Minikube K8 cluster ---------------------------
# By default only 1 CPU is allocated to containers which is not enough for computations required for 3D rendering
# In that case, we can specify num CPU like below:
# 	`minikube start --cpus 6`

minikube.build: ## [k8] build image and copy to minikube local repository
	eval `minikube -p minikube docker-env` && \
		docker build \
		--build-arg="GO_VERSION=$(GO_VERSION)" \
		--platform linux/amd64 -t local/webg3n -f Dockerfile .

minikube.deploy: ## [k8] deploys app in minikube cluster
	@kubectl apply -f k8/deployment.yaml
	@kubectl apply -f k8/service.yaml

minikube.cleanup: ## [k8] cleanup stack
	@kubectl delete service webg3n-service
	@kubectl delete deployment webg3n-deployment

minikube.url: ## [k8] get service url to expose your service
	minikube service webg3n-service --url

minikube.images: ## [k8] list all images inside minikube
	minikube image ls

minikube.stats: ## list deployments, services and pods
	@echo "---- deployment ----"
	@kubectl get deployment -o wide
	@echo
	@echo "---- services ----"
	@kubectl get services -o wide
	@echo
	@echo "---- pods ----"
	@kubectl get pods -o wide

help:
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ": "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
