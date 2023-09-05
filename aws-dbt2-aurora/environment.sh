#!/bin/bash -eux
# Generic
export BUCKET_NAME="${BUCKET_NAME:=ebac-reports}"
export BENCHMARK_NAME="${BENCHMARK_NAME:=AWS_DBT2_AURORA}"

# Ansible
export ANSIBLE_VERBOSITY="${ANSIBLE_VERBOSITY:=0}"

# Terraform
export SSH_USER="${SSH_USER:=rocky}"
export REGION="${REGION:=us-east-1}"
export ZONE0="${ZONE0:=us-east-1b}"
export ZONE1="${ZONE1:=us-east-1c}"
export DRIVER_INSTANCE_TYPE="${DRIVER_INSTANCE_TYPE:=c5.xlarge}"
# Database Instance
export PG_INSTANCE_TYPE="${PG_INSTANCE_TYPE:=db.r5.2xlarge}"
# Database Settings
export PG_VERSION="${PG_VERSION:=14}"

# Ansible
export ANSIBLE_VERBOSITY="${ANSIBLE_VERBOSITY:=0}"

# DBT2
export DBT2_DURATION="${DBT2_DURATION:=10000}"
export DBT2_WAREHOUSE="${DBT2_WAREHOUSE:=3600}"
export DBT2_CONNECTIONS="${DBT2_CONNECTIONS:=64}"
export DBT2_RAMPUP="${DBT2_RAMPUP:=45}"
