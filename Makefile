.PHONY: build run clean

IMAGE := munshkr/gcc-arm-embedded
TAG := 10-2020q4

run: build
	docker run -it --rm $(IMAGE):$(TAG)

build:
	docker build -t $(IMAGE):$(TAG) -t $(IMAGE):latest .

push: build
	docker push $(IMAGE):$(TAG)

clean:
	docker rmi $(IMAGE)
