for f in data/SRR534006_?.fastq.gz
do
     fastqc -o fastqc_output -f fastq --noextract -t 4 $f
 done
