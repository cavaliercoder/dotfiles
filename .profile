# load site specific (home/work/other) environment
[[ -f ~/.profile-site ]] && source ~/.profile-site

# print TODO notes in source files
todo(){
	[[ -n $1 ]] && grep -iIRno 'todo:.*' $1
	[[ -z $1 ]] && grep -iIRno 'todo:.*' .
}

# change terminal tab name
tabname(){
  printf "\e]1;$1\a"
}

# change terminal window name
winname(){
  printf "\e]2;$1\a"
}

# add /etc/hosts entries for each docker-machine instances
update-docker-hosts(){
	# default instance
	sudo sed -i '' '/docker\.local$/d' /etc/hosts
	MACHINE_IP="$(echo $DOCKER_HOST | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
	[[ -n $MACHINE_IP ]] && sudo /bin/bash -c "echo \"${MACHINE_IP}	docker.local\" >> /etc/hosts"
	export DOCKER_IP=$MACHINE_IP

	# other instances
	docker-machine ls | tail -n +2 | awk '{print $1}' \
	| while read -r MACHINE; do
		MACHINE_IP="$(docker-machine env ${MACHINE} | grep DOCKER_HOST | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
		[[ -n $MACHINE_IP ]] && sudo /bin/bash -c "echo \"${MACHINE_IP}	${MACHINE}.docker.local\" >> /etc/hosts"
	done
}

# run a container interactively with defaults
docker-shell(){
	PWDN=$(basename $PWD)
	docker run \
		-it \
		--rm \
		-v $HOME:/home/$USER \
		-v $PWD:/root/$PWDN \
		-w /root/$PWDN \
		$@
}

# docker container and image cleanup function
docker-cleanup(){
	docker rm $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# my docker boxes
docker-buildbox(){
	docker-shell cavaliercoder/buildbox $@
}

# command aliases
alias ls="ls -G"
alias ssh="ssh -o TCPKeepAlive=yes -Y"

# set prompt
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]"

# configure Go
export GREP_OPTIONS="--color"
export GOPATH=$HOME/Development/gocode

# configure PATH
export PATH=$PATH:$HOME/bin:/usr/local/bin:$GOPATH/bin

# init docker client
eval "$(docker-machine env default)"
update-docker-hosts
export no_proxy=$no_proxy,$DOCKER_IP
export NO_PROXY=$no_proxy

# brew autocomlete
source $(brew --repository)/Library/Contributions/brew_bash_completion.sh
