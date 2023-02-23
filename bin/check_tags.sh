#!/bin/bash
set +x
service_list=( "ec2" "rds" "kinesis" "route53" "dynamo" "kms" "msk" "sqs" "sns" "lambda" "ssm" )
cd $HOME/work/aws-cloudformation-user-guide/doc_source

for srv in ${service_list[@]}; do
    ag -o --no-numbers '^`Tags`.*\n(.*\n)+?.*Update requires.*\[.*\]' aws-resource-*"$srv"*.md
done
