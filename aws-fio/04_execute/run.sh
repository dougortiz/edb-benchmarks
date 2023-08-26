#!/bin/bash -eux

SOURCEDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
TERRAFORM_PROJECT_NAME="terraform"
TERRAFORM_PROJECT_PATH="${SOURCEDIR}/../${TERRAFORM_PROJECT_NAME}"
RESULTS_DIRECTORY="${SOURCEDIR}/../results"

export ANSIBLE_PIPELINING=true
export ANSIBLE_SSH_ARGS="-o ForwardX11=no -o UserKnownHostsFile=/dev/null"
export ANSIBLE_SSH_PIPELINING=true
export ANSIBLE_HOST_KEY_CHECKING=false

# Run the benchmark

for FIO_TEST in fio-sr fio-sr fio-rr fio-rw fio-rewr; do
	ansible-playbook "${SOURCEDIR}/playbook-execute.yml" \
		-i "${TERRAFORM_PROJECT_PATH}/inventory.yml" \
		-e "@$SOURCEDIR/../environment.yml" \
		-e "fio_test=${FIO_TEST}" \
		-e "terraform_project_path=${TERRAFORM_PROJECT_PATH}" \
		-e "results_directory=${RESULTS_DIRECTORY}"
done

for FIO_NUMJOBS in $(seq 1 "${FIO_MAXJOBS}"); do
	ansible-playbook "${SOURCEDIR}/playbook-create-fio-job.yml" \
		-i "${TERRAFORM_PROJECT_PATH}/inventory.yml" \
		-e "@$SOURCEDIR/../environment.yml" \
		-e "fio_numjobs=${FIO_NUMJOBS}" \
		-e "fio_test=${FIO_TEST}" \
		-e "terraform_project_path=${TERRAFORM_PROJECT_PATH}" \
		-e "results_directory=${RESULTS_DIRECTORY}"

	ansible-playbook "${SOURCEDIR}/playbook-execute.yml" \
		-i "${TERRAFORM_PROJECT_PATH}/inventory.yml" \
		-e "@$SOURCEDIR/../environment.yml" \
		-e "fio_numjobs=${FIO_NUMJOBS}" \
		-e "fio_test=fio-nj${FIO_NUMJOBS}" \
		-e "terraform_project_path=${TERRAFORM_PROJECT_PATH}" \
		-e "results_directory=${RESULTS_DIRECTORY}"
done
