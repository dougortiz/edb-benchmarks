DBT-2 workload on GCP CloudSQL

This is a 2-tier test running a TPC-C-like workload with a multi-process event
driven driver with no thinking and keying time.

Environment variables:

- TERRAFORM_PROJECT_PATH - Absolute path to the terraform project created by
  edb-terraform.
- DBT2_CONNECTIONS - Number of database connections to target, default 72.
- DBT2_DURATION - Duration in minutes execution, default 3600 (1 hour.)
- DBT2_WAREHOUSE - Number of warehouses, default 10000 (approximately 1 TB of
  raw data.)
