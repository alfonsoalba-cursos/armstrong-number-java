USERNAME := $(shell echo ${USER})
USERID := $(shell id -u)
TAG := java-16-gradle
.PHONY: build
build:
	docker build --build-arg USERNAME=$(USERNAME) --build-arg USERID=$(USERID) -t $(TAG) .

bash:
	docker run --rm -ti -v $(shell pwd):/app -w /app $(TAG) bash

distributions:
	docker run --rm -ti -v $(shell pwd):/app -w /app $(TAG) ./gradlew assembleDist

   
