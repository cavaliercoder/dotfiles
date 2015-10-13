# A docker image with build tools for frequently used platforms
FROM centos:7

MAINTAINER "Ryan Armstrong" <ryan@cavaliercoder.com>

# install updates and packages
RUN yum update -y && yum install -y --nogpgcheck \
	autoconf \
	automake \
	curl \
	epel-release \
	gcc \
	gdb \
	git \
	libtool \
	lsof \
	make \
	postgresql \
	postgresql-devel \
	strace \
	tcpdump \
	vim-enhanced \
	wget

# install Go
RUN curl -fsSLO "https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz" \
	&& tar -C /usr/local -xzf golang1.5.1.linux-amd64.tar.gz \
	&& rm -f golang1.5.1.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
	
# clear caches
RUN yum clear all

CMD /bin/bash
