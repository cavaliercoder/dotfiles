# 0400 perms prevent accidental local updates
INSTALL = install -vCm 400 -o $(USER)
MKDIR = install -vdm 700 -o $(USER)

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
	$(INSTALL) .profile.d/aws.sh $(HOME)/.profile.d/aws.sh
	$(INSTALL) .profile.d/docker.sh $(HOME)/.profile.d/docker.sh
	$(INSTALL) .profile.d/git.sh $(HOME)/.profile.d/git.sh
	$(INSTALL) .profile.d/go.sh $(HOME)/.profile.d/go.sh
	$(INSTALL) .profile.d/brew.sh $(HOME)/.profile.d/brew.sh
	$(INSTALL) .profile.d/pycharm.sh $(HOME)/.profile.d/pycharm.sh
	$(INSTALL) .profile.d/rust.sh $(HOME)/.profile.d/rust.sh
	install -vCm 600 vscode-settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json
	sudo launchctl load $(HOME)/Library/LaunchAgents/com.brew.update.plist
	sudo install -vCm 440 -o root -g wheel sudoers.d/wheel /etc/sudoers.d/wheel
	./.macos

.PHONY: all install
