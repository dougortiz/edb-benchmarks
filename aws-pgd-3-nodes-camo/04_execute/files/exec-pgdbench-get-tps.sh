#!/bin/bash -eux

# We must be in EPAS installation path if we want to execute pgd_bench
cd $PGD_HOME
tps=$(cat ./pgd_bench_results.txt | grep "tps = " | grep -v "including" | sed -E "s/tps = ([0-9\.]+).*/\1/")
echo "${tps}" > ./pgd_bench_tps_results.csv
sleep 5