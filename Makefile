DOCKER_REPO?=ridecharge
CONTAINER=$(DOCKER_REPO)/nginx

all: build push

build:
	sudo docker build -t $(CONTAINER):latest . 

push:
	sudo docker push $(CONTAINER)
