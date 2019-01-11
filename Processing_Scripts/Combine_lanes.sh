Base_dir=/projects/mills_11549/sequencing/shotgun_20180411
Seq_dir=/sequencing/ucsd/complete_runs/180407_D00611_0618_AHFMFGBCX2_Knight_Severity_DDW/Mills_11549

Samples=${Base_dir}/Sample_list.txt
A1=*L001_R1_*.fastq.gz
A2=*L001_R2_*.fastq.gz
B1=*L002_R1_*.fastq.gz
B2=*L002_R2_*.fastq.gz
while IFS= read -r i; do cat ${Seq_dir}/${i}${A1} ${Seq_dir}/${i}${B1}  > ${Base_dir}/Combined_lanes/${i}R1_combined.fq.gz; done < ${Samples}
while IFS= read -r i; do cat ${Seq_dir}/${i}${A2} ${Seq_dir}/${i}${B2}  > ${Base_dir}/Combined_lanes/${i}R2_combined.fq.gz; done < ${Samples}
