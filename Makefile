.PHONY: build run clean

IMAGE := munshkr/gcc-arm-embedded
TAG := 10-2020q4

run: build
	docker run --platform=linux/amd64 -it --rm -v $(HOME)/nopia/nopia-fw/:/work $(IMAGE):$(TAG) bash

build:
	docker build --platform=linux/amd64 --progress plain -t $(IMAGE):$(TAG) -t $(IMAGE):latest .

push: build
	docker push --all-tags $(IMAGE)

clean:
	docker rmi $(IMAGE)
