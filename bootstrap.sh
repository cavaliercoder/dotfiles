#!/bin/bash
# Bootstrap a new OS X machine with my tools.
# NOTE: May take several hours and GBs of internettings.

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install brew-cask

# install packages
brew cask install \
	firefox \
	google-chrome \
	sublime-text \
	virtualbox \
	vagrant \
	vlc \
	xquartz

brew install \
	autoconf \
	automake \
	docker \
	docker-machine \
	dos2unix \
	git \
	go \
	jq \
	libtool \
	mercurial \
	node \
	packer \
	tmux \
	wget

npm install --global \
	bower \
	grunt \
	gulp

# bootstrap Golang
[[ -z $GOPATH ]] && export GOPATH=$HOME/Development/gocode
[[ -d $GOPATH ]] || mkdir -p $GOPATH

# bootstrap docker
docker-machine create --driver virtualbox default
eval "$(docker-machine env default)"

docker pull centos:7
docker pull centos:6
docker pull ubuntu:trusty
docker pull ubuntu:precise
docker pull debian:jessie
docker pull debian:wheezy
docker pull opensuse:13.2

# bootstrap vagrant
vagrant box add --provider virtualbox bento/centos-7.1
vagrant box add --provider virtualbox bento/centos-6.7

# TODO: bootstrap sublime and packages
