all: image

image:
	docker build -t cavaliercoder/buildbox .

test:
	docker run -it --rm cavaliercoder/buildbox

.PHONY: all image test
