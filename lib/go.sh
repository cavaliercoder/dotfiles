#!/bin/sh
# configure Go
GO_VERSION=1.15.3
GO_ENV_FILE="~/.gimme/envs/go${GO_VERSION}.env"

export GREP_OPTIONS="--color"
export GOPATH=$HOME/Development/gocode
export PATH=$GOPATH/bin:$PATH

if [ -f "${GO_ENV_FILE}" ]; then
	. ${GO_ENV_FILE}
fi

function letsgo {
	cd $GOPATH/src/github.com/cavaliercoder
	go version
	code .
}
