USERNAME := $(shell echo ${USER})
USERID := $(shell id -u)
TAG := java-18-gradle
build:
	docker build --build-arg USERNAME=$(USERNAME) --build-arg USERID=$(USERID) -t $(TAG) .

bash:
	docker run --rm -ti -v $(shell pwd):/app -w /app $(TAG) bash
