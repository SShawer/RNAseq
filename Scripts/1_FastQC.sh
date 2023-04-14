#!/bin/bash
#
#SBATCH -t 00-12:00:00
#SBATCH --mem-per-cpu=20G
#SBATCH --mail-type=ALL
#SBATCH -c 6
#
# RNAseq Sherif March 2023

# Date/Time
date
set -e

# Load modules and set environment variables
module load FastQC
condition_names="Condition A vs B vs C vs D"
fastq_dir="../fastq"
report_dir="../quality/pre_trim_report"
temp_dir="$report_dir/temp"

# Print start message
echo "FastQ analysis of RNAseq data $condition_names"
echo "Using FastQC version $(fastqc --version)"

# Create output directories if they don't exist
mkdir -p "$report_dir" "$temp_dir"

# Run FastQC
fastqc -o "$report_dir" --threads 4 --dir "$temp_dir" "$fastq_dir/*.fastq.gz"

# Print completion message
echo "FastQC analysis complete"
