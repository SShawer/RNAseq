#!/bin/bash
#
#SBATCH -t 00-12:00:00
#SBATCH --mem-per-cpu=30G
#SBATCH --mail-type=ALL
#SBATCH -c 4

# Date/Time
echo ""
date
echo ""

# Script title
echo ""
echo "Generating normalised read counts using StringTie - Sherif - March 2023"
echo ""

# Environment
module load StringTie
echo ""
echo "----- StringTie -----"
echo ""

# Define input and output directories and files
input_dir="../star_ucsc"
output_dir="../stringtie"
gtf_file="../genome_ucsc/hg38.ncbiRefSeq.gtf"

# Create output directory if it doesn't exist
mkdir -p $output_dir

# Loop through all .bam files in input directory
for bam_file in $input_dir/*.bam
do
  sample_name=$(basename "$bam_file" .bam)
  output_file="$output_dir/$sample_name.gtf"
  stringtie -p 4 $bam_file -G $gtf_file -o $output_file -e -B -A $output_dir/$sample_name.counts.tsv
done

# Cleaning up the name of the output files
mmv '../stringtie/*_Aligned.sortedByCoord.out.*' '../stringtie/#1.#2'

echo ""
echo "----- DONE -----"
echo ""
date
