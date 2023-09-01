#!/bin/bash -eux
# Generic
export BUCKET_NAME="${BUCKET_NAME:=ebac-reports}"
export BENCHMARK_NAME="${BENCHMARK_NAME:=AWS_PGD_3_NODES}"

# Ansible
export ANSIBLE_VERBOSITY="${ANSIBLE_VERBOSITY:=0}"

# Credentials
#export REPO_TOKEN="${REPO_TOKEN:=<secret>}"
export REPO_TOKEN="${REPO_TOKEN:=pdZe6pcnWIgmuqdR7v1L38rG6Z6wJEsY}"

# Terraform
export REGION="${REGION:=us-east-2}"
export ZONE0="${ZONE0:=us-east-2a}"
export ZONE1="${ZONE1:=us-east-2b}"
export ZONE2="${ZONE2:=us-east-2c}"
# Benchmarker instance
export DRIVER_INSTANCE_TYPE="${DRIVER_INSTANCE_TYPE:=c5d.2xlarge}"
# Postgres Instance
export PG_INSTANCE_TYPE="${PG_INSTANCE_TYPE:=c5d.2xlarge}" # Assumes attached storage devices from instance type
export PG_IMAGE_NAME="${PG_IMAGE_NAME:=Rocky-8-ec2-8.6-20220515.0.x86_64}"
export PG_IMAGE_OWNER="${PG_IMAGE_OWNER:=679593333241}"
export PG_SSH_USER="${PG_SSH_USER:=rocky}"

# # TPCC
# export TPCC_DURATION="${TPCC_DURATION:=20}"
# export TPCC_WAREHOUSE="${TPCC_WAREHOUSE:=1000}"
# export TPCC_RAMPUP="${TPCC_RAMPUP:=1}"
# export TPCC_LOADER_VUSERS="${TPCC_LOADER_VUSERS:=75}"
# export TPCC_MIN_VUSERS="${TPCC_MIN_VUSERS:=5}"
# export TPCC_MAX_VUSERS="${TPCC_MAX_VUSERS:=100}"
# export TPCC_STEP_VUSERS="${TPCC_STEP_VUSERS:=5}"

# # Storage
# export PGDATA_STORAGE_TYPE="${STORAGE_TYPE:=io2}"
# export PGDATA_STORAGE_SIZE="${STORAGE_SIZE:=4096}"
# export PGDATA_STORAGE_IOPS="${STORAGE_IOPS:=21667}"
# export PGWAL_STORAGE_TYPE="${STORAGE_TYPE:=io2}"
# export PGWAL_STORAGE_SIZE="${STORAGE_SIZE:=4096}"
# export PGWAL_STORAGE_IOPS="${STORAGE_IOPS:=21667}"