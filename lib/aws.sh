#!/bin/bash
# cheat functions for the AWS CLI
function aws-list-instances() {
	aws ec2 describe-instances $@ | jq '.Reservations[].Instances[] | .InstanceId + ", " + .PrivateIpAddress + ", " + .PrivateDnsName + ", " + (.Tags[] | select(.Key=="Name") | .Value)'
}

function aws-elb-health() {
	aws elb describe-instance-health --load-balancer-name $@ | jq '.InstanceStates[] | .InstanceId + ": " + .State'
}

function aws-elb-instances() {
	for instance in $(aws elb describe-instance-health --load-balancer-name $@ | jq '.InstanceStates[].InstanceId'); do
		aws-list-instances --instance-ids ${instance}
	done
}

function aws-list-vpcs() {
	aws ec2 describe-vpcs $@ \
		| jq -rM '.Vpcs[] | .CidrBlock + ", " + .VpcId + ", " + (.Tags[]? | select(.Key == "Name") | .Value)' \
		| sort
}

function aws-list-subnets() {
	aws ec2 describe-subnets $@ \
		| jq -rM '.Subnets[] | .CidrBlock + ", " + .SubnetId + ", " + .AvailabilityZone + (.Tags[]? | select(.Key=="Name") | .Value)' \
		| sort
}
