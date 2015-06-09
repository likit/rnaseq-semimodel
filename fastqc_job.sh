#!/bin/sh -login
#PBS -l nodes=1:ppn=1,mem=24gb,walltime=2:00:00
#PBS -M snoppy_girlly@hotmail.com
#PBS -m abe
#PBS -N FastQC

cd ${PBS_O_WORKDIR}

module load FastQC/0.11.2
fastqc -o fastqc_output -f fastq --noextract -t 4 data/SRR536786_2.fastq.gz
