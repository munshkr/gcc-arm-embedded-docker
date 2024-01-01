.PHONY: build run clean

TAG := munshkr/gcc-arm-embedded:latest

run: build
	docker run -it --rm $(TAG)

build:
	docker build -t $(TAG) .

push: build
	docker push $(TAG)

clean:
	docker rmi $(TAG)
