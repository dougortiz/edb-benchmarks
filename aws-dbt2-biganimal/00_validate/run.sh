#!/bin/bash -eux

SOURCEDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
BENCHMARK_DIRECTORY="$(realpath "${SOURCEDIR}/..")"
ROOT_DIRECTORY="$(realpath "${BENCHMARK_DIRECTORY}/..")"
TERRAFORM_PROJECT_NAME="terraform"
TERRAFORM_PROJECT_PATH="${BENCHMARK_DIRECTORY}/${TERRAFORM_PROJECT_NAME}"
TERRAFORM_PLAN_FILENAME="terraform.plan"
RESULTS_DIRECTORY="${BENCHMARK_DIRECTORY}/results"
ANSIBLE_ROLES_PATH="${ROOT_DIRECTORY}/roles"
# stringified json or a json/yaml files full path
OVERRIDES="${OVERRIDES:=}"

ANSIBLE_ROLES_PATH=$ANSIBLE_ROLES_PATH \
    ansible-playbook "${SOURCEDIR}/run.yml" \
        -e "env_yml_file=${BENCHMARK_DIRECTORY}/environment.yml" \
        -e "env_source_file=${BENCHMARK_DIRECTORY}/environment.sh" \
        -e "vars_file=${BENCHMARK_DIRECTORY}/vars.yml" \
        -e "overrides=${OVERRIDES}" \
        -e "root_directory=${ROOT_DIRECTORY}" \
        -e "benchmark_directory=${BENCHMARK_DIRECTORY}" \
        -e "results_directory=${RESULTS_DIRECTORY}" \
        -e "terraform_project_name=${TERRAFORM_PROJECT_NAME}" \
        -e "terraform_project_path=${TERRAFORM_PROJECT_PATH}" \
        -e "terraform_plan_filename=${TERRAFORM_PLAN_FILENAME}"

