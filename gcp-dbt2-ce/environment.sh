#!/bin/bash -eux
# Generic
export BUCKET_NAME=${BUCKET_NAME:=ebac-reports}
export BENCHMARK_NAME=${BENCHMARK_NAME:=AWS_DBT2_AURORA}

# Ansible
export ANSIBLE_VERBOSITY="${ANSIBLE_VERBOSITY:=0}"

# TERRAFORM VARIABLES
export REGION="${REGION:=us-west1}"
export ZONE0="${ZONE0:=us-west1-b}"
export INSTANCE_TYPE="${INSTANCE_TYPE:=c2-standard-30}"

# Postgres Settings
export PG_INSTANCE_TYPE="${PG_INSTANCE_TYPE:=c2-standard-30}"
export PG_STORAGE_TYPE="${PG_STORAGE_TYPE:=pd-ssd}"
export PG_STORAGE_SIZE="${PG_STORAGE_SIZE:=4096}"
# This benchmark assumes GCP and attached storage.
# GCP virtual machines ignore iops with attached storage
# export PG_STORAGE_IOPS="${PG_STORAGE_IOPS:=1000}"

# DBT2
export DBT2_CONNECTIONS="${DBT2_CONNECTIONS:=72}"
export DBT2_DURATION="${DBT2_DURATION=:3600}"
export DBT2_WAREHOUSE="${DBT2_WAREHOUSE=:10000}"
