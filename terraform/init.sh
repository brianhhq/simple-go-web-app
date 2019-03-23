#!/bin/bash

set -eu

ENV=${1:-}
if [ -z "$ENV" ] ; then
    echo "Usage: $0 <env>"
    echo "Where <env> exists as inventories/<env>.tf"
    echo "Example:"
    echo "  $0 prod"
    exit 1
fi

INV_DIR=$(dirname $(readlink $0))/inventories
INV_FILE=$INV_DIR/$ENV.tf
if [ ! -f "$INV_FILE" ] ; then
    echo "Expected inventory file $INV_FILE is missing!"
    exit 1
fi


TFSTATE=./.terraform/terraform.tfstate
if [ -e "$TFSTATE" ] ; then
    echo "Removing existing $TFSTATE as we are initialising a new environment"
    rm $TFSTATE
fi

terraform init -backend-config="bucket=$ENV.terraform.com"
