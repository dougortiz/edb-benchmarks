#!/bin/bash -eux

# Display parameters
echo $PGD_DURATION
echo $PGD_SCALE
echo $PGD_CLIENTS
echo $PG_NODE
echo $PG_PORT
echo $PG_DATABASE

# We must be in EPAS installation path if we want to execute pgd_bench
cd $PGD_HOME
./pgd_bench -h $PG_NODE -p $PG_PORT -i -q $PG_DATABASE -s $PGD_SCALE

echo Executing pgd_bench benchmark
if [ "$PGD_TYPE" == "CAMO" ]; then
    ./pgd_bench -T $PGD_DURATION -c $PGD_CLIENTS -N -m camo -h $PG_NODE -p $PG_PORT $PG_DATABASE $PG_NODE >> ~/pgd_bench_results.txt
else
    ./pgd_bench -m regular -p $PG_PORT -h $PG_NODE $PG_DATABASE -c $PGD_CLIENTS -T $PGD_DURATION -j 32  >> ~/pgd_bench_results.txt
fi