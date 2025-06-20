#!/bin/bash
# Laura Dean
# 19/6/25
# script written for running on the UoN HPC Ada

#SBATCH --job-name=ENA_fq_download
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5g
#SBATCH --time=2:00:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out

# set variables
wkdir= # working directory where your information files are stored and where you will download the data to
accessions=$wkdir/accessions.txt # text file containing a list of the accession numbers you wish to download


# get a list of the ftp file locations for files you want to download using the list of accession numbers
 > $wkdir/ftp_paths.txt


