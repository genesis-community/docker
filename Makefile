IMAGE := starkandwayne/genesis
TAG   ?= 2.7.1

build:
	docker build -t $(IMAGE):dev .
	docker run $(IMAGE):dev genesis -v
release: build
	docker tag $(IMAGE):dev $(IMAGE):latest
	docker tag $(IMAGE):dev $(IMAGE):$(TAG)
