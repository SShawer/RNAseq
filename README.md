# RNAseq
Scripts for RNA-seq analysis pipeline
--------------------------------------

This repository contains my scripts for RNA-seq analysis pipelines in order. 

This pipeline assumes you have access to a High Performance computer with the relevant packages installed.

I will be using bash script with a SLURM worload manager/scheduler. This is apparent in the shabang at the begining of each script. You can adjust accordingly. 

You will need to start with a directory called fastq containing the raw .fastq.gz files and another directory called scripts in which you will keep all the script files. You will need to run the scripts in order.

The analysis pipeline follows the following steps
-------------------------------------------------

1- Quality Check using **"FastQC"**

2- Combining the FastQC output using **"MultiQC"**

3- Trimming using **"Trim Galore"**

4- Re-checking quality using **"FastQC"**

5- Combining new FastQC output using **"MultiQC"**

6- Downloading reference genome 

7- Generating Genome index using **"STAR"**

8- Aligning reads to index using **"STAR"**

9- Indexing BAM files and creating BAI files using **"SAMtools"** 

10- Assigning read counts to genes using **"featureCounts"**

11- Generating normalised read counts using **"StringTie"**

12- Differential gene expression using **"DESeq2 within R"**

13- Data visualisation using **"multiple libraries within R (gplot, ggplot2, EnhancedVolcano)"**
