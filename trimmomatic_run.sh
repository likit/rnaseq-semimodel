#!/bin/bash
for f in data/SRR536787_1.fastq.gz
do
    qsub -v input="$f" protocol/trimmomatic_job.sh
done
