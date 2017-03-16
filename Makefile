DOCKER_IMAGE_VERSION=1.4.11
DOCKER_IMAGE_NAME=eimis/rpi-mosquitto
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	docker build -t $(DOCKER_IMAGE_TAGNAME) .
	docker tag $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

push:
	docker push $(DOCKER_IMAGE_TAGNAME)
	docker push $(DOCKER_IMAGE_NAME)

test:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) /bin/echo "Success."

rmi:
	docker rmi -f $(DOCKER_IMAGE_TAGNAME)

rebuild:
	docker rmi build
