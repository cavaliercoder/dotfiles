COPY = install -vCm 600

all: build

build:
	echo "Nothing to do yet"

install:
	$(COPY) .profile $(HOME)/.profile
	$(COPY) .vimrc $(HOME)/.vimrc
	$(COPY) .gitconfig $(HOME)/.gitconfig
	$(COPY) .gitignore_global $(HOME)/.gitignore_global
	$(COPY) com.brew.update.plist ~/Library/LaunchAgents/com.brew.update.plist
	$(COPY) com.default.machine.docker.plist \
		~/Library/LaunchAgents/com.default.machine.docker.plist

	launchctl load ~/Library/LaunchAgents/com.brew.update.plist
	launchctl load ~/Library/LaunchAgents/com.default.machine.docker.plist

.PHONY: all build install
