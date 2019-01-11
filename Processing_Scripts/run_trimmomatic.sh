#!/bin/bash

#PBS -N trimmomatic
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

while read id
do
  trimmomatic PE -threads $cpus -phred33 \
    ../${id}__R1_combined.fq.gz ../${id}__R2_combined.fq.gz \
    $tmp/$id.R1.P.fq.gz $tmp/$id.R1.U.fq.gz \
    $tmp/$id.R2.P.fq.gz $tmp/$id.R2.U.fq.gz \
    ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 \
    LEADING:20 TRAILING:20 AVGQUAL:30 MINLEN:32 TOPHRED33
  mv $tmp/$id.*.*.fq.gz ./
done < ids.txt
echo done
