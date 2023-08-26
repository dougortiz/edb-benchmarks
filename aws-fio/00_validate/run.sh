#!/bin/bash -eux

SOURCEDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
ansible-playbook "${SOURCEDIR}/run.yml" \
    -e "vars_file=${SOURCEDIR}/../environment.yml" \
    -e "env_file=${SOURCEDIR}/../environment.sh"
