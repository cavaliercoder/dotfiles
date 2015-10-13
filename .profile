PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]"

alias ls="ls -G"
alias todo="grep -IRn TODO" 

export GREP_OPTIONS="--color"
export GOPATH=$HOME/Development/gocode

export PATH=$PATH:$HOME/bin:/usr/local/bin:$GOPATH/bin

# init docker
eval "$(docker-machine env default)"

sudo sed -i '' '/docker\.local$/d' /etc/hosts
DOCKER_IP="$(echo $DOCKER_HOST | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
[[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP}	docker.local\" >> /etc/hosts"

# add /etc/hosts entries for each docker-machine instance
update-docker-hosts(){
	docker-machine ls | tail -n +2 | awk '{print $1}' \
	| while read -r MACHINE; do
		DOCKER_IP="$(docker-machine env ${MACHINE} | grep DOCKER_HOST | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
		[[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP}	${MACHINE}.docker.local\" >> /etc/hosts"
	done
}

# docker container and image cleanup function
docker-cleanup(){
	docker rm $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# brew autocomlete
source $(brew --repository)/Library/Contributions/brew_bash_completion.sh
