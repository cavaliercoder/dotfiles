#!/bin/bash
# Bootstrap a new OS X machine with my tools.
# NOTE: May take several hours and GBs of internettings.

# install homebrew
which brew >/dev/null || \
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install packages
brew tap caskroom/cask
brew cask install \
	1password \
	dropbox \
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
	docker-compose \
	docker-machine \
	dos2unix \
	gimme \
	git \
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
gimme 1.7.3
gimme 1.6.3
gimme 1.5.4
gimme 1.4.3
gimme 1.3.3

# bootstrap docker
docker-machine create --driver virtualbox default
eval "$(docker-machine env default)"

docker pull centos:7
docker pull centos:6
docker pull ubuntu:trusty
docker pull ubuntu:precise
docker pull ubuntu:xenial
docker pull debian:jessie
docker pull debian:wheezy
docker pull opensuse:13.2

# bootstrap vagrant
vagrant box add --provider virtualbox bento/centos-7.2
vagrant box add --provider virtualbox bento/centos-6.7

# configure sublime
curl -Lo \
	~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package \
	https://packagecontrol.io/Package%20Control.sublime-package
