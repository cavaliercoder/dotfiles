DOCKER_BUILD = docker build --pull

all: \
	centos-6 \
	centos-7 \
	debian-wheezy \
	debian-jessie \
	ubuntu-precise \
	ubuntu-trusty \
	ubuntu-xenial

centos-6:
	$(DOCKER_BUILD) \
		--file centos-6.Dockerfile \
		--tag cavaliercoder/centos:6 \
		.

centos-7:
	$(DOCKER_BUILD) \
		--file centos-7.Dockerfile \
		--tag cavaliercoder/centos:latest \
		--tag cavaliercoder/centos:7 \
		.

debian-wheezy:
	$(DOCKER_BUILD) \
		--file debian-wheezy.Dockerfile \
		--tag cavaliercoder/debian:wheezy \
		.

debian-jessie:
	$(DOCKER_BUILD) \
		--file debian-jessie.Dockerfile \
		--tag cavaliercoder/debian:latest \
		--tag cavaliercoder/debian:jessie \
		.

ubuntu-precise:
	$(DOCKER_BUILD) \
		--file ubuntu-precise.Dockerfile \
		--tag cavaliercoder/ubuntu:precise \
		.

ubuntu-trusty:
	$(DOCKER_BUILD) \
		--file ubuntu-trusty.Dockerfile \
		--tag cavaliercoder/ubuntu:trusty \
		.

ubuntu-xenial:
	$(DOCKER_BUILD) \
		--file ubuntu-xenial.Dockerfile \
		--tag cavaliercoder/ubuntu:latest \
		--tag cavaliercoder/ubuntu:xenial \
		.
