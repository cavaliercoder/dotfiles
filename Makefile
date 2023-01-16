# 0400 perms prevent accidental local updates
# INSTALL = install -vCm 400 -o $(USER)
# MKDIR = install -vdm 700 -o $(USER)
INSTALL = ln -sf

all:
	echo "Nothing to do"

install:
	$(INSTALL) $(realpath conf/.zshrc) $(HOME)/.zshrc
	$(INSTALL) $(realpath conf/.gitconfig) $(HOME)/.gitconfig
	$(INSTALL) $(realpath conf/.vimrc) $(HOME)/.vimrc
	$(INSTALL) $(realpath conf/vscode-settings.json) $(HOME)/Library/Application\ Support/Code/User/settings.json
	
.PHONY: all install
