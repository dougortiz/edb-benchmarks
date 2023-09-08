#!/bin/bash -eux
# Generic
export BUCKET_NAME="${BUCKET_NAME:=ebac-reports}"

# CAMO Benchmark Name
export BENCHMARK_NAME="${BENCHMARK_NAME:=AWS_PGD_CAMO_3_NODES}"
# COMMIT SCOPE Benchmark Name
#export BENCHMARK_NAME="${BENCHMARK_NAME:=AWS_PGD_CS_3_NODES}"

# Ansible
export ANSIBLE_VERBOSITY="${ANSIBLE_VERBOSITY:=0}"

# Credentials
export REPO_TOKEN="${REPO_TOKEN:=<secret>}"

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

# CAMO pgd_bench configuration settings
export PGD_HOME="${PGD_HOME:=/usr/edb/as15/bin/}"
export PGD_DURATION="${PGD_DURATION:=15}"
export PGD_SCALE="${PGD_SCALE:=10}"
export PGD_CLIENTS="${PGD_CLIENTS:=4}"

# Storage
export PGDATA_STORAGE_TYPE="${STORAGE_TYPE:=io2}"
export PGDATA_STORAGE_SIZE="${STORAGE_SIZE:=4096}"
export PGDATA_STORAGE_IOPS="${STORAGE_IOPS:=21667}"
export PGWAL_STORAGE_TYPE="${STORAGE_TYPE:=io2}"
export PGWAL_STORAGE_SIZE="${STORAGE_SIZE:=4096}"
export PGWAL_STORAGE_IOPS="${STORAGE_IOPS:=21667}"