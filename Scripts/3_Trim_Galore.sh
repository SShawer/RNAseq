#!/bin/bash
#
#SBATCH -t 00-48:00:00
#SBATCH --mem-per-cpu=30G
#SBATCH --mail-type=ALL
#SBATCH -c 4
#
# RNAseq Sherif March 2023 - Trimming 

# Start message
date
echo ""
echo "Trimming of RNAseq data ISK (Condition A vs B vs C vs D)"
echo ""

# Stop at runtime errors
set -e

# Load modules
module load Trim_Galore

# Tools
echo "Trim_Galore:"
trim_galore --version
echo ""
echo "Cut_Adapt: version"
cutadapt --version
echo ""

# Trimming with Trim_Galore and CutAdapt
echo ""
echo " ----- Trim_Galore/CutAdapt ----- "
echo ""

mkdir -p ../processed_fastq

for i in $(ls ../fastq/*.fastq.gz | cut -d "_" -f 1)
do
   trim_galore \
     --output_dir ../processed_fastq/ \
     --max_n 10 \
     --quality 20 \
     --length 20 \
     --illumina \
     --stringency 6 \
     --cores 4
     --phred33 \
     --paired ${i}_r1.fastq.gz ${i}_r2.fastq.gz
done

# Completion message
echo ""
echo "----- Done -----"
date
