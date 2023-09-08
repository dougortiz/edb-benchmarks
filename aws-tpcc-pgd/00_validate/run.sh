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

if (( $(echo "$TPCC_WAREHOUSE < 2000" | bc -l) )); then
   echo "TPCC_WAREHOUSE: $TPCC_WAREHOUSE";
   echo "HammerDB Warehouses, cannot be lower than 2000!"
   exit 1
fi

if (( $(echo "$TPCC_DURATION < 5" | bc -l) )); then
   echo "TPCC_DURATION: $TPCC_DURATION";
   echo "HammerDB run duration, cannot be lower than 5!"
   exit 1
fi

if (( $(echo "$TPCC_RAMPUP < 10" | bc -l) )); then
   echo "TPCC_RAMPUP: $TPCC_RAMPUP";
   echo "HammerDB RampUp, cannot be lower than 10!"
   exit 1
fi

if (( $(echo "$TPCC_LOADER_VUSERS < 75" | bc -l) )); then
   echo "TPCC_LOADER_VUSERS: $TPCC_LOADER_VUSERS";
   echo "HammerDB Number of virtual users, cannot be lower than 75!"
   exit 1
fi

if (( $(echo "$TPCC_MIN_VUSERS < 1" | bc -l) )); then
   echo "TPCC_MIN_VUSERS: $TPCC_MIN_VUSERS";
   echo "HammerDB Number of Minimum virtual users, cannot be lower than 1!"
   exit 1
fi

if (( $(echo "$TPCC_MAX_VUSERS < 14" | bc -l) )); then
   echo "TPCC_MAX_VUSERS: $TPCC_MAX_VUSERS";
   echo "HammerDB Number of Maximum virtual users, cannot be lower than 14!"
   exit 1
fi


if (( $(echo "$TPCC_STEP_VUSERS < 1" | bc -l) )); then
   echo "TPCC_STEP_VUSERS: $TPCC_STEP_VUSERS";
   echo "HammerDB Increased Virtual Users, cannot be lower than 1!"
   exit 1
fi

if [ -z "${TPA_2Q_SUBSCRIPTION_TOKEN}" ]; then
   echo "TPA_2Q_SUBSCRIPTION_TOKEN: $TPA_2Q_SUBSCRIPTION_TOKEN";
   echo "TPA Exec Subscription Token, cannot be empty!"
   exit 1
fi
