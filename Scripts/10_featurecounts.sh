#!/bin/bash
#
#SBATCH -t 00-04:00:00
#SBATCH --mem-per-cpu=20G
#SBATCH --mail-type=ALL
#SBATCH -c 4

# Date/Time
echo ""
date
echo ""

# Script title
echo ""
echo "Assigning read counts to genes using featureCounts - Sherif - March 2023"
echo ""

# Environment -	If featureCounts/Subread is not	available on HPC, we will need to download and install before proceeding as follow 
# (Remove the following section and replace with module load if available on HPC)
# Download and Install feature counts
wget -P ../packages https://sourceforge.net/projects/subread/files/subread-2.0.2/subread-2.0.2-source.tar.gz/download -O subread-2.0.2-source.tar.gz
tar xvf ../packages/subread-2.0.2-source.tar.gz
cd ../packages/subread-2.0.2-source/src
make -f Makefile.Linux
cd ../scripts

# Set path to the installed featureCounts (correct this	path uding your	directories) - If it is	alreally available on HPC, replace the export line with	module load subread
export PATH=/nobackup/[INSERT STUDENT NUMBER]/rnaseq/packages/subread-2.0.2-source/bin/:$PATH
echo ""
echo "----- featureCounts ----"
echo ""

# Define variables using shell expansion with an asterisk
bam_files=../star_ucsc/*.bam
gtf_file=../genome_ucsc/hg38.ncbiRefSeq.gtf
output_dir=../counts_ucsc/

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Run featureCounts
featureCounts -T 4 -p -t exon -g gene_id -a "$gtf_file" -o "${output_dir}counts.txt" $bam_files

# Cleaning up the output file and extracting the columns of interest
cut -f 1,7,8,9,10,11,12 "${output_dir}counts.txt" > "${output_dir}cleaned_counts.txt"

echo ""
echo "----- DONE -----"
echo ""
