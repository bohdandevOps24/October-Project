#!/bin/bash

ami_id = ami-037774efca2da0726

instance_id = $(aws ec2 run-instances --image-id $ami_id --count 1 --instance-type t2.micro --key-name ohio-public-key  --region us-east-2 —query Instances.InstanceId --output text)

aws ec2 terminate-instances —instance-ids $nstance_id —region us-east-2