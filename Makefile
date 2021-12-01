IMAGE := starkandwayne/genesis
TAG   ?= 2.7.12

rebuild:
	docker build -t $(IMAGE):dev --build-arg GENESIS_VERSION=$(TAG) --no-cache .
	docker run $(IMAGE):dev genesis -v
build:
	docker build -t $(IMAGE):dev --build-arg GENESIS_VERSION=$(TAG) .
	docker run $(IMAGE):dev genesis -v
release: build
	docker tag $(IMAGE):dev $(IMAGE):latest
	docker tag $(IMAGE):dev $(IMAGE):$(TAG)
push: release
	docker push $(IMAGE):latest
	docker push $(IMAGE):$(TAG)
