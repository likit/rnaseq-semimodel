#!/bin/sh -login
#PBS -l nodes=1:ppn=5,mem=24gb,walltime=8:00:00
#PBS -M preeyano@msu.edu
#PBS -m abe
#PBS -N Trimmomatic

cd ${PBS_O_WORKDIR}
module load Trimmomatic/0.32
first=${input}
first=$(basename $first .fastq.gz)
second=$(echo $first | sed s/_1/_2/)

java -jar $TRIM/trimmomatic PE -threads 4 ${data_dir}/$first.fastq.gz ${data_dir}/$second.fastq.gz ${out_dir}/$first.trimmed.pe.fastq.gz ${out_dir}/$second.trimmed.pe.fastq.gz ${out_dir}/$first.trimmed.se.fastq.gz ${out_dir}/$second.trimmed.se.fastq.gz ILLUMINACLIP:/mnt/research/common-data/Bio/Trimmomatic/adapters/TruSeq3-PE.fa:2:30:10
