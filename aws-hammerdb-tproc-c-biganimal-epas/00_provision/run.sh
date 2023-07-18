#!/bin/bash -eux

SOURCEDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
TERRAFORM_PROJECT_NAME="terraform"
TERRAFORM_PROJECT_PATH="${SOURCEDIR}/../${TERRAFORM_PROJECT_NAME}"
TERRAFORM_PLAN_FILENAME="terraform.plan"
RESULTS_DIRECTORY="${SOURCEDIR}/../results"

ansible-playbook "$RUNDIR/generate.yml" \
      -e "template_file=$RUNDIR/../templates/infrastructure.yml.j2" \
      -e "dest_file=$RUNDIR/../infrastructure.yml" \
      -e "@$RUNDIR/../vars.yml" \
      -e "region=us-east-1" \
      -e "zone0=us-east-1b" \
      -e "instance_type=c5.9xlarge" \
      -e "pg_instance_type=r5.4xlarge" \
      -e "pg_storage_type=io2" \
      -e "pg_storage_properties=io2" \
      -e "pg_storage_size=300" \
      -e "pg_storage_iops=15000" \
      -e "pg_engine=epas" \
      -e "pg_version=14" \
      -e "pg_password=1234567890zyx" \
      -e "ba_project_id=$BA_PROJECT_ID"

# edb-terraform saves a backup of infrastructure.yml in <project-name>/infrastructure.yml.bak
#   this also includes the edb-terraform version used to generate the files
edb-terraform generate --project-name "${TERRAFORM_PROJECT_NAME}" \
                       --work-path "${SOURCEDIR}/../" \
                       --infra-file "${SOURCEDIR}../infrastructure.yml" \
                       --user-templates "${SOURCEDIR}/templates/inventory.yml.tftpl" \
                       --cloud-service-provider aws
# reset biganimal project id for reuse and edb-terraform creates infrastructure.yml.bak within the project directory
sed -i "s/${BA_PROJECT_ID}/<PROJECT_ID>/g" "${SOURCEDIR}/../infrastructure.yml"
cd "${TERRAFORM_PROJECT_PATH}"

# .terraform.lock.hcl will be saved here by terraform to lock provider versions and can be reused
terraform init

# Save terraform plan for inspection/reuse
terraform plan -out="$TERRAFORM_PLAN_FILENAME"

# terraform.tfstate/.tfstate.backup will be left around since we use short-term credentials
terraform apply -auto-approve "$TERRAFORM_PLAN_FILENAME"

# copy files into results directory
mkdir -p "${RESULTS_DIRECTORY}"
# .tfstate might contain secrets
# ssh short term keys currently used
# .terraform created at run-time and controlled by terraform CLI 
rsync --archive \
      --exclude="*tfstate*" \
      --exclude="*ssh*" \
      --exclude=".terraform/" \
      --recursive \
      "${TERRAFORM_PROJECT_PATH}" \
      "${RESULTS_DIRECTORY}/"
