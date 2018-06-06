#!/bin/sh

PRODUCTION_HOSTNAME='community.hypernode.io'

# die when a command has a nonzero exit code
set -e 

# apply deployment playbook with production settings
ansible-playbook provisioning/community.yml --extra-vars "@vars.yml" --user=app -i "$PRODUCTION_HOSTNAME," # mind the trailing comma
