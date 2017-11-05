FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

# install dev tools
RUN apt-get update && apt-get -y install \
  apt-file \
  autoconf automake debhelper devscripts dh-make gcc git libconfig-dev \
  libdbus-1-dev libpq-dev libtool m4 make rpm vim \
  && rm -rf /var/lib/apt/lists/*
