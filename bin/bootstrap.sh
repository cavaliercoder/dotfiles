#!/bin/bash
# Bootstrap a new OS X machine with my tools.
# NOTE: May take several hours and GBs of internettings.

export PATH=/usr/local/bin:$PATH

# install homebrew
which brew >/dev/null || \
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install packages
brew tap caskroom/cask
brew cask install \
	1password \
	android-file-transfer \
	dropbox \
	firefox \
	google-chrome \
	hyper \
	java \
	messenger \
	skype \
	spotify \
	sublime-text \
	unrarx \
	virtualbox \
	vagrant \
	visual-studio-code \
	vlc \
	vnc-viewer \
	xquartz

brew install \
	autoconf \
	automake \
	awscli \
	azure-cli \
	docker \
	docker-compose \
	docker-machine \
	dos2unix \
	gimme \
	git \
	gnupg \
	htop \
	ipcalc \
	jq \
	libtool \
	mercurial \
	node \
	packer \
	pandoc \
	postgresql \
	reattach-to-user-namespace \
	terraform \
	tmux \
	tree \
	wget

brew install homebrew/apache/ab
brew install cavaliercoder/dmidecode/dmidecode

# install vscode extensions
while read extension; do
    code --install-extension $extension
done <<EOL
Borke.puppet
PeterJausovec.vscode-docker
austin.code-gnu-global
donjayamanne.python
lukehoban.Go
ms-vscode.PowerShell
ms-vscode.cpptools
rebornix.Ruby
tht13.python
waderyan.gitblame
EOL

# bootstrap npm modules
npm install --global \
	bower \
	grunt \
	gulp \
	pm2

# bootstrap Golang
[[ -z $GOPATH ]] && export GOPATH=$HOME/Development/gocode
[[ -d $GOPATH ]] || mkdir -p $GOPATH
gimme 1.8
gimme 1.7.5
gimme 1.6.4
gimme 1.5.4
gimme 1.4.3
gimme 1.3.3

# bootstrap docker
docker-machine create --driver virtualbox default
eval "$(docker-machine env default)"

docker pull centos:latest
docker pull centos:7
docker pull centos:6
docker pull ubuntu:latest
docker pull ubuntu:trusty
docker pull ubuntu:precise
docker pull ubuntu:xenial
docker pull debian:latest
docker pull debian:jessie
docker pull debian:wheezy
docker pull opensuse:latest
docker pull opensuse:13.2

# bootstrap vagrant
vagrant box add --provider virtualbox centos/7.2
vagrant box add --provider virtualbox centos/6.7

# configure sublime
curl -Lo \
	~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package \
	https://packagecontrol.io/Package%20Control.sublime-package
