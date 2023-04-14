#!/bin/bash
#
#SBATCH -t 00-04:00:00
#SBATCH --mem-per-cpu=20G
#SBATCH --mail-type=ALL
#SBATCH -c 4
#
# RNAseq Sherif March 2023

# Date/Time
date
set -e

# Load modules and set environment variables
module load MultiQC
report_dir="../quality/post_trim_report"
multiqc_dir="$report_dir/multiqc"

# Print start message
echo "MultiQC analysis of FastQC output AFTER trimmming"
echo "Using MultiQC version $(multiqc --version)"

# Create output directory if it doesn't exist
mkdir -p "$multiqc_dir"

# Run MultiQC
multiqc "$report_dir" -o "$multiqc_dir"

# Print completion message
echo "MultiQC analysis complete"

