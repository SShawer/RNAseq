#!/bin/bash
#
#SBATCH -t 00-04:00:00
#SBATCH --mem-per-cpu=10G
#SBATCH --mail-type=ALL
#SBATCH -c 6

# Date/Time
date

# Title of the script
echo "Genome Generation using UCSC Homo sapiens GRCh38 reference genome"

# Loading modules
module load STAR

# Working version 
echo ""
echo "STAR version" 
STAR --version
echo ""

echo "----- STAR Genome Generate -----"

mkdir -P ../index_ucsc
 
STAR --runThreadN 6 \
    --runMode genomeGenerate \
    --genomeDir ../index_ucsc \
    --genomeFastaFiles ../genome_ucsc/hg38.fa  \
    --sjdbGTFfile ../genome_ucsc/hg38.ncbiRefSeq.gtf  \
    --sjdbOverhang 150

echo ""
echo "----- DONE -----"
echo ""
