#!/bin/bash -eux

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

echo "DBT2_DURATION: $DBT2_DURATION"
echo "DBT2_WAREHOUSE: $DBT2_WAREHOUSE"
echo "DBT2_CONNECTIONS: $DBT2_CONNECTIONS"

# Left as comments for template examples of possible latter validations
# Assign possible number of processors
#NUM_OF_PROCS_1=1

# Left as comments for template examples of possible latter validations
# Perform division calculations
#PROC_OPT_1=$(echo "$DBT2_CONNECTIONS / $NUM_OF_PROCS_1" | bc)

if (( $(echo "$DBT2_WAREHOUSE < 10" | bc -l) )); then
   echo "DBT2_WAREHOUSE: $DBT2_WAREHOUSE";
   echo "DBT2 Number of Warehouses is too low, causes zero division error!!!"
   exit 1
fi

if (( $(echo "$DBT2_CONNECTIONS < 64" | bc -l) )); then
   echo "DBT2_CONNECTIONS: $DBT2_CONNECTIONS";
   echo "DBT2 Number of Connections is too low, causes zero division error!!!"
   exit 1
fi

# Left as comments for template examples of possible latter validations
#if (( $(echo "$PROC_OPT_1 < 1" | bc -l) )); then
#   echo "DBT2_CONNECTIONS: $DBT2_CONNECTIONS   Number of Processors: $NUM_OF_PROCS_1   Result: $PROC_OPT_1";
#   echo "DBT2 Connections is too low, causes zero division error!!!"
#   exit 1
#fi
