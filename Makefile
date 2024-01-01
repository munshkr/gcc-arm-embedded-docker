.PHONY: build run clean

TAG := munshkr/gcc-arm-embedded:latest

run: build
	docker run -it --rm -v $(TAG)

build:
	docker build -t $(TAG) .

clean:
	docker rmi $(TAG)
