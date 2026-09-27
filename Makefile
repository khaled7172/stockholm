IMAGE = stockholm

all: build

build:
	docker build -t $(IMAGE) .

run:
	docker run --rm -v ~/infection:/root/infection $(IMAGE)

silent:
	docker run --rm -v ~/infection:/root/infection $(IMAGE) --silent

reverse:
	@read -p "Enter key: " key; \
	docker run --rm -v ~/infection:/root/infection $(IMAGE) --reverse $$key

help:
	docker run --rm $(IMAGE) --help

version:
	docker run --rm $(IMAGE) --version

clean:
	docker rmi -f $(IMAGE)

re: clean build

.PHONY: all build run silent reverse help version clean re
