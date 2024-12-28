.PHONY: build clean

IMAGE := munshkr/gcc-arm-embedded
TAG := 10-2020q4

build:
	docker build --platform=linux/amd64 --progress plain -t $(IMAGE):$(TAG) -t $(IMAGE):latest .

push: build
	docker push --all-tags $(IMAGE)

clean:
	docker rmi $(IMAGE)
