FROM centos:7

MAINTAINER "Ryan Armstrong" <ryan@cavaliercoder.com>

# install dev tools
RUN yum install -y epel-release && yum -y install \
	autoconf automake bzip2	createrepo curl	dbus-devel gcc gdb git libtool lsof \
	make postgresql postgresql-devel python-devel python-pip python34-devel \
  redhat-rpm-config rpm-build rpm-sign rpmdevtools ruby ruby-devel \
  rubygem-bundler rubygem-rake rubygems selinux-policy-devel strace tcpdump \
	tree valgrind vim-enhanced wget yum-utils \
  && yum clean all

# install useful gems
RUN gem install --no-ri --no-rdoc \
	fpm puppet

# install useful python packages
RUN pip install \
	boto3 zabbix-template-converter
