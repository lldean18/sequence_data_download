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
wkdir=/gpfs01/home/mbzlld/data/hagfish/Eptatretus_burgeri_ref # working directory where your information files are stored and where you will download the data to
accession=GCA_035128595 # the accession number of the assembly you wish to download

# move to the directory in which you want to save the assembly
cd $wkdir

# download the assembly
# get the link for the fasta assembly file by finding the sequence set on ENA e.g. https://www.ebi.ac.uk/ena/browser/view/FYBX03000000
# then right click on SET FASTA under Download in the box on the right-hand side of the page and copy the link
# paste it after wget below
# e.g. for the Inshore Hagfish Eptatretus burgeri genome assembly:
wget ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fyb/FYBX03.fasta.gz


