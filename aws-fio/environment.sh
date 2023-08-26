#!/bin/bash -eux

# Generic
export BUCKET_NAME=${BUCKET_NAME:=ebac-reports}
export BENCHMARK_NAME=${BENCHMARK_NAME:=AWS_fio}

# Ansible
export ANSIBLE_VERBOSITY="${ANSIBLE_VERBOSITY:=0}"

# TERRAFORM VARIABLES
export SSH_USER="${SSH_USER:=rocky}"
export REGION="${REGION:=us-east-1}"
export ZONE0="${ZONE0:=us-east-1b}"

# EC2 Instance
export INSTANCE_TYPE="${INSTANCE_TYPE:=r5b.2xlarge}"
export STORAGE_TYPE="${STORAGE_TYPE:=io2}"
export STORAGE_SIZE="${STORAGE_SIZE:=4096}"
export STORAGE_IOPS="${STORAGE_IOPS:=21667}"

# fio parameters
export FIO_DURATION="${FIO_DURATION:=1h}"
export FIO_MAXJOBS="${FIO_MAXJOBS:=300}"
