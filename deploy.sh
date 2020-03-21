#!/bin/bash
set -e

#unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY no_proxy

export AWS_DEFAULT_PROFILE='default'
export AWS_DEFAULT_REGION='eu-central-1'

TEMPLATE='./budgets.template'
STACK_NAME='common-budgets'

aws cloudformation validate-template --template-body file://$TEMPLATE

aws cloudformation deploy --template-file $TEMPLATE --stack-name $STACK_NAME\
 --parameter-overrides \
    budgetAmount='500' \
    accountAdminEmail=$1\
    nameprefix='common'
