# start tmux if not already attached
case $- in *i*)
    [ -z "$TMUX" ] && exec tmux
esac

# load site specific (home/work/other) environment
[[ -f ~/.profile-site ]] && source ~/.profile-site

# print TODO notes in source files
todo(){
	if [[ $# -eq 0 ]]; then
    grep -iIRno 'todo:.*' .
  else
    grep -iIRno 'todo:.*' $@
  fi
}

# change terminal tab name
tabname(){
  printf "\e]1;$1\a"
}

# change terminal window name
winname(){
  printf "\e]2;$1\a"
}

# command aliases
alias ls="ls -lahG"
alias ssh="ssh -o TCPKeepAlive=yes -Y"
alias jobs="jobs -l"

# set prompt
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]"

# configure PATH
export PATH=./node_modules/.bin:$HOME/bin:/usr/local/bin:$PATH

# init thefuck
eval "$(thefuck --alias)"

# configure puppet binaries
export PATH=/opt/puppetlabs/bin:$PATH

# brew autocomlete
source $(brew --repository)/completions/bash/brew
for file in /usr/local/etc/bash_completion.d/*; do
	source $file
done
