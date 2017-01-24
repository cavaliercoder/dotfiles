# A docker image with build tools for frequently used platforms
FROM centos:7

MAINTAINER "Ryan Armstrong" <ryan@cavaliercoder.com>

# install updates and packages
RUN yum clean all && yum install -y epel-release && yum install -y \
	autoconf \
	automake \
	bzip2 \
	createrepo \
	curl \
	gcc \
	gdb \
	git \
	libtool \
	lsof \
	make \
	postgresql \
	postgresql-devel \
	redhat-rpm-config \
	rpm-build \
	rpmdevtools \
	ruby \
	ruby-devel \
	rubygem-bundler \
	rubygem-rake \
	rubygems \
	strace \
	tcpdump \
	tree \
	vim-enhanced \
	wget \
	yum-utils

# install Go
ENV GOPATH /root/gocode
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN curl -fsSLO "https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz" \
	&& tar -C /usr/local -xzf go1.7.3.linux-amd64.tar.gz \
	&& rm -f go1.7.3.linux-amd64.tar.gz

# install useful gems
RUN gem install --no-ri --no-rdoc \
	fpm \
	puppet

# create various projects dirs
RUN mkdir -vp ${GOPATH}/{bin,src,pkg}
RUN mkdir -vp /root/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

# clear caches
RUN yum clean all

WORKDIR /root

CMD /bin/bash
