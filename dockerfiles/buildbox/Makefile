all: build

build:
	docker build \
		--build-arg "http_proxy=$(http_proxy)" \
		--build-arg "https_proxy=$(https_proxy)" \
		--build-arg "no_proxy=$(no_proxy)" \
		--tag cavaliercoder/buildbox .

run:
	docker run -it --rm cavaliercoder/buildbox

.PHONY: all build run
