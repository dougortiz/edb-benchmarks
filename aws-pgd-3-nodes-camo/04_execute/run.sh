#!/bin/bash -eux

SOURCEDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
TERRAFORM_PROJECT_NAME="terraform"
TERRAFORM_PROJECT_PATH="${SOURCEDIR}/../${TERRAFORM_PROJECT_NAME}"
RESULTS_DIRECTORY="${SOURCEDIR}/../results"

export ANSIBLE_PIPELINING=true
export ANSIBLE_SSH_ARGS="-o ForwardX11=no -o UserKnownHostsFile=/dev/null"
export ANSIBLE_SSH_PIPELINING=true
export ANSIBLE_HOST_KEY_CHECKING=false

ansible-playbook \
    -i "${TERRAFORM_PROJECT_PATH}/inventory.yml" \
    -e "@$SOURCEDIR/../environment.yml" \
    -e "@$SOURCEDIR/../vars.yml" \
    -e "terraform_project_path=${TERRAFORM_PROJECT_PATH}" \
    -e "pgd_bench_duration=${PGD_BENCH_DURATION}" \
    -e "pgd_bench_scale_factor=${PGD_BENCH_SCALE_FACTOR}" \
    -e "pgd_bench_clients=${PGD_BENCH_CLIENTS}" \
    -e "results_directory=${RESULTS_DIRECTORY}/report-data" \
    "${SOURCEDIR}/playbook-pgdbench-run.yml"
