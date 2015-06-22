#!/bin/sh -login
#PBS -l nodes=1:ppn=5,mem=24gb,walltime=12:00:00
#PBS -M preeyano@msu.edu
#PBS -m abe
#PBS -N Cufflinks

cd ${PBS_O_WORKDIR}

module load cufflinks/2.2.1
cufflinks -o SRR534005_tophat/cufflinks -p 4 SRR534005_tophat/accepted_hits.bam
