#!/bin/bash
# Laura Dean
# 23/6/25
# 5/12/25
# script written for running on the UoN HPC Ada

# script to download a genome assembly from NCBI

#SBATCH --job-name=NCBI_asm_download
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5g
#SBATCH --time=2:00:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out

### set working directory where you wish to store downloaded files
#wkdir=/gpfs01/home/mbzlld/data/splice_variant_search
wkdir=/gpfs01/home/mbzlld/data/danionella

### move to the directory in which you want to save the assembly
cd $wkdir


### Get the ftp address for the file you want to download from the NCBI website
### Find the web page with the accession number e.g.
### https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/
### From this page click FTP at the top, this takes you to the ftp site with all the files for that accession
### right click the file you want to download and click copy link address
### paste the ftp link after wget below


### download the assembly
### for the human assembly (URL copied from the NCBI ftp site)
#wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.40_GRCh38.p14/GCF_000001405.40_GRCh38.p14_genomic.fna.gz
### for the human annotation (URL copied from the NCBI ftp site)
#wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.40_GRCh38.p14/GCF_000001405.40_GRCh38.p14_genomic.gtf.gz


### for the zebrafish
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/049/306/965/GCF_049306965.1_GRCz12tu/GCF_049306965.1_GRCz12tu_genomic.fna.gz
### and the annotation
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/049/306/965/GCF_049306965.1_GRCz12tu/GCF_049306965.1_GRCz12tu_genomic.gff.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/049/306/965/GCF_049306965.1_GRCz12tu/GCF_049306965.1_GRCz12tu_genomic.gtf.gz




