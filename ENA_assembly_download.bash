#!/bin/bash
# Laura Dean
# 23/6/25
# script written for running on the UoN HPC Ada

#SBATCH --job-name=ENA_asm_download
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5g
#SBATCH --time=2:00:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out

# set variables
wkdir= # working directory where your information files are stored and where you will download the data to
accession=GCA_035128595 # the accession number of the assembly you wish to download

# move to the directory in which you want to save the assembly
cd $wkdir

# download the assembly



