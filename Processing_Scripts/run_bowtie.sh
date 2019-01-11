#!/bin/bash

#PBS -N bowtie
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=64gb
#PBS -V
#PBS -j oe
#PBS -d .

set -e
cpus=$PBS_NUM_PPN

export TMPDIR=/panfs/panfs1.ucsd.edu/panscratch/$USER
tmp=$(mktemp -d --tmpdir)
export TMPDIR=$tmp
trap "rm -r $tmp; unset TMPDIR" EXIT

# do something

out=/projects/mills_11549/sequencing/shotgun_20180411/Combined_lanes/trimmomatic/bowtie2
source activate kneaddata

while read id
do
  bowtie2 -p ${cpus} -x /home/rhmills/share/kd_dbs/human/Homo_sapiens_Bowtie2_v0.1/Homo_sapiens  --very-sensitive -1 ${id}.R1.P.fq.gz -2 ${id}.R2.P.fq.gz 2> log.bowtie | \
  samtools view -f 12 -F 256 -b -o ${tmp}/${id}.unsorted.bam 2> log.other

  samtools sort -T ${tmp}/${id} -@ ${cpus} -n \
  -o ${tmp}/${id}.bam ${tmp}/${id}.unsorted.bam 2> log.other

  bedtools bamtofastq -i ${tmp}/${id}.bam -fq ${tmp}/${id}.R1.trimmed.filtered.fastq \
  -fq2 ${tmp}/${id}.R2.trimmed.filtered.fastq 2> log.other

  pigz -p ${cpus} -c ${tmp}/${id}.R1.trimmed.filtered.fastq > ${tmp}/${id}.R1.trimmed.filtered.fastq.gz
  pigz -p ${cpus} -c ${tmp}/${id}.R2.trimmed.filtered.fastq > ${tmp}/${id}.R2.trimmed.filtered.fastq.gz

  cp ${tmp}/${id}.R1.trimmed.filtered.fastq.gz ${out}/
  cp ${tmp}/${id}.R2.trimmed.filtered.fastq.gz ${out}/
done < ids.txt
echo done

