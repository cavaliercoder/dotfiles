# configure PATH
export PATH=./node_modules/.bin:$HOME/bin:/usr/local/bin:$PATH

# set editor to vi
export EDITOR=vim
export VISUAL=vim

# start tmux if not started, not in ssh session and shell is interactive
case $- in *i*)
	export TERM=xterm-256color
    [ -z "$TMUX" ] && exec tmux
esac

# set prompt
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]"

# command aliases
alias ls="ls -lahG"
alias jobs="jobs -l"

# print TODO notes in source files
todo(){
	if [[ $# -eq 0 ]]; then
		grep -iIRno 'todo:.*' .
	else
		grep -iIRno 'todo:.*' $@
	fi
}

# run all profile scripts in ~/.profile.d/
for script in ~/.profile.d/*.sh; do
  source ${script}
done
