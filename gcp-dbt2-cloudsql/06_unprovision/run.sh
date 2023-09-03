#!/bin/bash -eux

SOURCEDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
TERRAFORM_PROJECT_NAME="terraform"
TERRAFORM_PROJECT_PATH="${SOURCEDIR}/../${TERRAFORM_PROJECT_NAME}"

cd "${TERRAFORM_PROJECT_PATH}"

# Need to exclude google sql user from destroy -> https://github.com/hashicorp/terraform-provider-google/issues/3820
terraform state rm module.database_us_east4[\"mydb1\"].google_sql_user.user
terraform destroy -auto-approve
