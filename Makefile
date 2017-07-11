# 0400 perms prevent accidental local updates
INSTALL = install -vCm 400
MKDIR = install -vdm 700

all:
	echo "Nothing to do"

install:
	$(MKDIR) $(HOME)/.ssh
	$(MKDIR) $(HOME)/.profile.d
	$(INSTALL) .gitconfig $(HOME)/.gitconfig
	$(INSTALL) .gitignore_global $(HOME)/.gitignore_global
	$(INSTALL) .hyper.js $(HOME)/.hyper.js
	$(INSTALL) .profile $(HOME)/.profile
	$(INSTALL) .pydistutils.cfg $(HOME)/.pydistutils.cfg
	$(INSTALL) .rpmmacros $(HOME)/.rpmmacros
	$(INSTALL) .ssh/config $(HOME)/.ssh/config
	$(INSTALL) .tmux.conf $(HOME)/.tmux.conf
	$(INSTALL) .tmux.conf.local $(HOME)/.tmux.conf.local
	$(INSTALL) .vimrc $(HOME)/.vimrc
	$(INSTALL) com.brew.update.plist $(HOME)/Library/LaunchAgents/com.brew.update.plist
	$(INSTALL) lib/aws.sh $(HOME)/.profile.d/aws.sh
	$(INSTALL) lib/docker.sh $(HOME)/.profile.d/docker.sh
	$(INSTALL) lib/git.sh $(HOME)/.profile.d/git.sh
	$(INSTALL) lib/go.sh $(HOME)/.profile.d/go.sh
	$(INSTALL) vscode-settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json
	sudo launchctl load $(HOME)/Library/LaunchAgents/com.brew.update.plist

.PHONY: all pull install
