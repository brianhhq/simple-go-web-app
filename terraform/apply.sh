#!/bin/bash

set -eu

cd $(dirname $0)

JQ=$(which jq)

if [ -z "$JQ" ] ; then
    echo "Please install jq"
    exit 1
fi

if [ ! -f ./.terraform/terraform.tfstate ] ; then
    echo "Please run ./init.sh first to initialise terraform remote state"
    exit 1
fi

ENV_NAME=$(cat ./.terraform/terraform.tfstate  | jq -r '.backend.config.bucket | split(".")[0]')

INV_FILE=$(dirname $(readlink $0))/inventories/$ENV_NAME.tf

if [ -z "$INV_FILE" ] ; then
    echo "Unable to find inventory file for $ENV_NAME"
    exit 1
fi

terraform apply -var-file=$INV_FILE $@
