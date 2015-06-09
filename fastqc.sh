 for f in data/*.fastqc.gz
 do
     qsub -v 'input=$f' protocol/fastqc_job.sh
 done
