#!/bin/bash


id_for_ami="ami-037774efca2da0726"


instance_id=$(aws ec2 run-instances \
    --image-id $id_for_ami \
    --count 1 \
    --instance-type t2.micro \
    --key-name ohio-public-key \
    --region us-east-2 \
    --query 'Instances[0].InstanceId' \
    --output text)


sleep 60

# stoping the instance
aws ec2 terminate-instances --instance-ids $instance_id --region us-east-2

