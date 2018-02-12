# Makefile to build container
# Handles the entire process
# build, tag, and push

IMAGE = $(REGISTRY)/image-name
TAG = 1.0

.PHONY: all build push

all: build push

build:
	docker build --no-cache -t $(IMAGE):$(TAG) .

push:
	docker push $(IMAGE):$(TAG)
