#!/bin/sh
# configure Go
export GREP_OPTIONS="--color"
export GOPATH=$HOME/Development/gocode
export PATH=$GOPATH/bin:$PATH
eval "$(gimme 1.7.5)" 2>/dev/null
