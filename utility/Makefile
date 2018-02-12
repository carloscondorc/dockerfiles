# Makefile to build container
# Handles the entire process
# build, tag, and push

IMAGE = $(REGISTRY)/jmosco-utility
TAG := $$(git log -1 --pretty=%h)

.PHONY: all build push

all: build push

build:
	docker build --no-cache -t $(IMAGE):$(TAG) .

push:
	docker push $(IMAGE):$(TAG)
