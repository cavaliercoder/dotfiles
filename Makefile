# 0400 perms prevent accidental local updates
INSTALL = install -vCm 400
MKDIR = install -vdm 700

all:
	echo "Nothing to do"

install:
	$(MKDIR) $(HOME)/.profile.d
	$(INSTALL) .gitconfig $(HOME)/.gitconfig
	$(INSTALL) .gitignore_global $(HOME)/.gitignore_global
	$(INSTALL) .hyper.js $(HOME)/.hyper.js
	$(INSTALL) .profile $(HOME)/.profile
	$(INSTALL) .pydistutils.cfg $(HOME)/.pydistutils.cfg
	$(INSTALL) .tmux.conf $(HOME)/.tmux.conf
	$(INSTALL) .tmux.conf.local $(HOME)/.tmux.conf.local
	$(INSTALL) .vimrc $(HOME)/.vimrc
	$(INSTALL) com.brew.update.plist $(HOME)/Library/LaunchAgents/com.brew.update.plist
	$(INSTALL) lib/aws.sh $(HOME)/.profile.d/aws.sh
	$(INSTALL) lib/docker.sh $(HOME)/.profile.d/docker.sh
	$(INSTALL) lib/git.sh $(HOME)/.profile.d/git.sh
	$(INSTALL) lib/go.sh $(HOME)/.profile.d/go.sh
	install -vCm 600 vscode-settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json
	sudo launchctl load $(HOME)/Library/LaunchAgents/com.brew.update.plist
	sudo install -vCm 440 -o root -g wheel sudoers.d/wheel /etc/sudoers.d/wheel
	./.macos

.PHONY: all install
