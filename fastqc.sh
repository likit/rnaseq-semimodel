 # for f in data/*.fastq.gz
 # do
 #     qsub -v input="$f" protocol/fastqc_job.sh
 # done

 for f in trimmed_data/*.fastq.gz
 do
     echo $f
     qsub -v input="$f" protocol/fastqc_job.sh
 done
