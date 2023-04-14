#!/bin/bash
#
#SBATCH -t 00-04:00:00
#SBATCH --mem-per-cpu=20G
#SBATCH --mail-type=ALL
#SBATCH -c 6

# Date/Time
echo ""
date
echo ""

# Script title 
echo ""
echo "Generating .bai files from .bam files using SAMtools"
echo ""

# Environment 
module load SAMtools
echo ""
echo "----- SAMtools -----"
echo ""

# Navigate to the directory containing the .bam files
cd ../star_ucsc

# Loop through all the .bam files and generate .bai files
for bamfile in *.bam
do
    samtools index $bamfile
done

echo ""
echo "----- DONE -----"
echo ""
date 
