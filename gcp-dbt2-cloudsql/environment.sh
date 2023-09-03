#!/bin/bash -eux
# Generic
export BUCKET_NAME=${BUCKET_NAME:=ebac-reports}
export BENCHMARK_NAME=${BENCHMARK_NAME:=GCP_DBT2_CLOUDSQL}

# Ansible
export ANSIBLE_VERBOSITY="${ANSIBLE_VERBOSITY:=0}"

# TERRAFORM VARIABLES
export REGION="${REGION:=us-east4}"
export ZONE0="${ZONE0:=us-east4-a}"
export DRIVER_INSTANCE_TYPE="${DRIVER_INSTANCE_TYPE:=c2-standard-30}"

# Postgres Settings
export PG_INSTANCE_TYPE="${PG_INSTANCE_TYPE:=db-n1-highmem-8}"
export PG_STORAGE_TYPE="${PG_STORAGE_TYPE:=pd-ssd}"
# db-f1-micro and db-g1-small max 3500 GB
export PG_STORAGE_SIZE="${PG_STORAGE_SIZE:=2048}"
export PG_STORAGE_PROPERTIES="${PG_STORAGE_PROPERTIES:=pd-ssd}"

# This benchmark assumes GCP and attached storage.
# GCP virtual machines ignore iops with attached storage
export PG_STORAGE_IOPS="${PG_STORAGE_IOPS:=5000}"
export PG_IMAGE_NAME="${PG_IMAGE_NAME:=rocky-linux-8}"
export PG_SSH_USER="${PG_SSH_USER:=rocky}"
export PG_ENGINE="${PG_ENGINE:=postgres}"
export PG_VERSION="${PG_VERSION:=14}"
export PG_OWNER="${PG_OWNER:=edb_admin}"
export PG_GROUP="${PG_GROUP:=$PG_OWNER}"
export PG_SUPERUSER="${PG_SUPERUSER:=$PG_OWNER}"
export PG_PASSWORD="${PG_PASSWORD:=1234567890zyx}"
export PG_PORT="${PG_PORT:=5432}"


# DBT2
export DBT2_CONNECTIONS="${DBT2_CONNECTIONS:=72}"
export DBT2_DURATION="${DBT2_DURATION:=3600}"
export DBT2_WAREHOUSE="${DBT2_WAREHOUSE:=10000}"
export DBT2_RAMPUP="${DBT2_RAMPUP:=45}"
