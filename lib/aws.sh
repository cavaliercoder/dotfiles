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

function aws-list-images() {
	aws ec2 describe-images --owners=self $@ \
		| jq -rM '.Images[] | .CreationDate + " " + .ImageId + " " + .State + " " + .Name + " " + "\"" + .Description + "\""' \
		| sort -r
}

function aws-list-rds-instances() {
	aws rds describe-db-instances $@ \
		| jq -rM '.DBInstances[] | .DBInstanceIdentifier + ", " + .DBInstanceClass + ", " + .Engine + " v" + .EngineVersion + ", " + .AvailabilityZone + ", " + .DBInstanceStatus' \
		| sort
}

function ssh-ec2 ()
{
    ID=$1;
    shift;
    ssh $(aws ec2 describe-instances --query="Reservations[*].Instances[*].PrivateIpAddress" --instance-ids $ID | jq -rM '.[][0]') $@
}

