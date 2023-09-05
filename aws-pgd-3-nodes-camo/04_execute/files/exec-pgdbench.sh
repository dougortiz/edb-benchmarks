#!/bin/bash -eux

# We must be in EPAS installation path if we want to execute pgd_bench
cd $PGD_HOME
echo Clearing pgd_bench tables
#./pgd_bench -i -I d
echo Initializing pgd_bench
./pgd_bench -h $PG_NODE -p $PG_PORT -i -q $PG_DATABASE -s $PGD_SCALE
echo Executing pgd_bench benchmark
./pgd_bench -T $PGD_DURATION -c $PGD_CLIENTS -N -m camo -h $PG_NODE -p $PG_PORT $PG_DATABASE $PG_NODE >> ~/pgd_bench_results.csv