#!/bin/bash
#
#SBATCH -t 00-04:00:00
#SBATCH --mem-per-cpu=20G
#SBATCH --mail-type=ALL
#

# Start message
date 
echo ""
echo "Downloading the reference genome HGCh38 FASTA and GTF files from UCSC"

# Creating the genome directory if it doesn't already exist
mkdir -p ../genome_ucsc

# Downloading the FASTA and GTF files through direct download links
wget -P ../genome_ucsc http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/genes/hg38.ncbiRefSeq.gtf.gz
wget -P ../genome_ucsc http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz

# Decompressing the .gz files
gunzip ../genome_ucsc/hg38.ncbiRefSeq.gtf.gz
gunzip ../genome_ucsc/hg38.fa.gz

echo ""
echo "----- DONE -----"
echo ""
date




