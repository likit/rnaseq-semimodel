find-overlap:
	bedtools intersect -a SRR534005_raw.gtf -b SRR534005_digi.gtf -wa -u | python protocol/remove-redundant-exon.py > uniq_overlap_raw.bed
	bedtools intersect -a SRR534005_digi.gtf -b SRR534005_raw.gtf -wa -u | python protocol/remove-redundant-exon.py > uniq_overlap_digi.bed
find-mismatch:
	bedtools subtract  -a SRR534005_raw.gtf -b SRR534005_digi.gtf  | python protocol/remove-redundant-exon.py > uniq_mismatch_raw.bed
	bedtools subtract -a SRR534005_digi.gtf -b SRR534005_raw.gtf | python protocol/remove-redundant-exon.py > uniq_mismatch_digi.bed
find-perfectmatch:
	bedtools intersect -a SRR534005_raw.gtf -b SRR534005_digi.gtf -wa -u -r -f 1.0 | python protocol/remove-redundant-exon.py > uniq_perfect_match.bed
count-alignment:
	bedtools multicov -bams SRR534005_tophat_diginorm/accepted_hits.sorted.bam -bed uniq_mismatch_digi.bed -D > uniq_mismatch_digi.cov
	bedtools multicov -bams SRR534005_tophat_diginorm/accepted_hits.sorted.bam -bed uniq_overlap_digi.bed -D > uniq_overlap_digi.cov
	bedtools multicov -bams SRR534005_tophat/accepted_hits.sorted.bam -bed uniq_mismatch_raw.bed -D > uniq_mismatch_raw.cov
	bedtools multicov -bams SRR534005_tophat/accepted_hits.sorted.bam -bed uniq_overlap_raw.bed -D > uniq_overlap_raw.cov
	bedtools multicov -bams SRR534005_tophat_diginorm/accepted_hits.sorted.bam -bed uniq_perfect_match.bed -D > uniq_perfect_match_digi.cov
	bedtools multicov -bams SRR534005_tophat/accepted_hits.sorted.bam -bed uniq_perfect_match.bed -D > uniq_perfect_match_raw.cov
count-total-nucleotide:
	awk '{print $$1,$$2,$$3,$$3 - $$2}' uniq_mismatch_raw.bed | awk '{sum+=$$4} END {print sum}'
	awk '{print $$1,$$2,$$3,$$3 - $$2}' uniq_mismatch_digi.bed | awk '{sum+=$$4} END {print sum}'
	awk '{print $$1,$$2,$$3,$$3 - $$2}' uniq_perfect_match.bed | awk '{sum+=$$4} END {print sum}'
	awk '{print $$1,$$2,$$3,$$3 - $$2}' uniq_overlap_raw.bed | awk '{sum+=$$4} END {print sum}'
	awk '{print $$1,$$2,$$3,$$3 - $$2}' uniq_overlap_digi.bed | awk '{sum+=$$4} END {print sum}'
copy-transcripts-bed:
	cp SRR534005_tophat/cufflinks/transcripts.bed SRR534005_raw.bed
	cp SRR534005_tophat_diginorm/cufflinks/transcripts.bed SRR534005_digi.bed
compare-introns:
	python protocol/compare_junction.py -b SRR534005_raw.bed -b SRR534005_digi.bed
find-canonical-splice-sites:
	python protocol/canonical-splice-site.py genome.fa SRR534005_raw.bed_diff_sp.txt
	python protocol/canonical-splice-site.py genome.fa SRR534005_digi.bed_diff_sp.txt

