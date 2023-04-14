#!/bin/bash
#
#SBATCH -t 00-48:00:00
#SBATCH --mem-per-cpu=30G
#SBATCH -p bigmem
#SBATCH --mail-type=ALL
#SBATCH -c 4

# Date/Time
echo ""
date
echo ""

# Start message
echo ""
echo "Read alignment using STAR with Reference genome from UCSC for RNAseq - Sherif - March 2023"
echo ""

# Load modules
module load STAR

# Check STAR version
echo ""
echo "STAR version:"
STAR --version
echo ""

# Alignment with STAR
echo "----- STAR Alignment -----"
echo ""

# Set the path to the reference genome index
REF_INDEX="../index_ucsc"

# Loop over the sample names
for R1 in ../processed_fastq/*_r1_val_1.fq.gz; do

  SAMPLE=$(basename "${R1}" _r1_val_1.fq.gz)
  R2="../processed_fastq/${SAMPLE}_r2_val_2.fq.gz"

  # Set the path to the output directory
  OUTPUT_DIR="../star_ucsc"

  # Create the output directory if it doesn't exist
  mkdir -p "${OUTPUT_DIR}"

  # Run STAR to align the reads
  STAR \
    --runThreadN 4 \
    --runMode alignReads \
    --readFilesCommand zcat \
    --genomeDir "${REF_INDEX}" \
    --readFilesIn "${R1}" "${R2}" \
    --outFileNamePrefix "${OUTPUT_DIR}/${SAMPLE}_" \
    --outSAMtype BAM SortedByCoordinate \
    --quantMode GeneCounts \
    --outSAMunmapped Within \
    --outSAMattributes Standard \
    --limitBAMsortRAM 31000000000 
done

# Completion message
echo ""
echo "------ DONE ------"
echo ""
date
