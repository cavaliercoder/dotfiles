#!/bin/sh

# add /etc/hosts entries for each docker-machine instances
function update-docker-hosts(){
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
function docker-shell(){
	PWDN=$(basename $PWD)
	docker run \
		-it \
		--rm \
		-v $HOME:/home/$USER \
		-v $PWD:/root/$PWDN \
		-w /root/$PWDN \
		-e "HTTP_PROXY=${HTTP_PROXY}" \
		-e "HTTPS_PROXY=${HTTPS_PROXY}" \
		-e "NO_PROXY=${NO_PROXY}" \
		-e "http_proxy=${HTTP_PROXY}" \
		-e "https_proxy=${HTTPS_PROXY}" \
		-e "no_proxy=${NO_PROXY}" \
		$@ /bin/bash
}

# docker container and image cleanup function
function docker-cleanup(){
	docker rm $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# my docker boxes
function docker-buildbox(){
	docker-shell cavaliercoder/buildbox $@
}

# restart services in docker-compose
function docker-compose-restart(){
	docker-compose stop $@
	docker-compose rm -f -v $@
	docker-compose create --force-recreate $@
	docker-compose start $@
}
