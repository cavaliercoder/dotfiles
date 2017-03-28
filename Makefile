COPY = install -vCm 600
MKDIR = install -vd

all:
	echo "Nothing to do"

install:
	$(COPY) .profile $(HOME)/.profile && cat lib/*.sh >> $(HOME)/.profile
	$(COPY) .vimrc $(HOME)/.vimrc
	$(COPY) .gitconfig $(HOME)/.gitconfig
	$(COPY) .gitignore_global $(HOME)/.gitignore_global
	$(MKDIR) -m 700 $(HOME)/.ssh 
	$(COPY) .ssh/config $(HOME)/.ssh/config
	$(COPY) .tmux.conf $(HOME)/.tmux.conf
	$(COPY) vscode-settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json
	$(COPY) com.brew.update.plist $(HOME)/Library/LaunchAgents/com.brew.update.plist
	sudo launchctl load $(HOME)/Library/LaunchAgents/com.brew.update.plist

.PHONY: all install
