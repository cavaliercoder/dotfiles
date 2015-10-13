all: build

build:
	echo "Nothing to do yet"

install:
	cp -f .profile $(HOME)/.profile

.PHONY: all build install
