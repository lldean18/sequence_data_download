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

# set working directory where you wish to store downloaded files
#wkdir=/gpfs01/home/mbzlld/data/hagfish/Eptatretus_burgeri_ref
#wkdir=/gpfs01/home/mbzlld/data/hagfish/Eptatretus_atami_ref
#wkdir=/gpfs01/home/mbzlld/data/gazelle
wkdir=/gpfs01/home/mbzlld/data/splice_variant_search

# move to the directory in which you want to save the assembly
cd $wkdir


### If you know the accession number you can paste it into the curl command below to see what files are available to download for that assembly
### This will show you the url for the fasta file and for other associated files if they exist (e.g. annotations)
#curl -s "https://www.ebi.ac.uk/ena/browser/api/xml/GCA_900186335?download=true" # for the inshore hagfish
#curl -s "https://www.ebi.ac.uk/ena/browser/api/xml/GCA_035128595?download=true" # for the brown hagfish
#curl -s "https://www.ebi.ac.uk/ena/browser/api/xml/GCA_019969365.1?download=true" # for Nanger dama
#curl -s "https://www.ebi.ac.uk/ena/browser/api/xml/GCA_000001405.29?download=true" # for Homo sapiens (no URL present for this one)

### download the assembly
### get the url from the curl command above then
### paste it after wget below

### e.g. for the Inshore Hagfish Eptatretus burgeri genome assembly (accession: GCA_900186335):
#wget ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/fyb/FYBX03.fasta.gz

### for the brown hagfish assembly (accession: GCA_035128595):
#wget ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/jax/JAXMNL01.fasta.gz

### for the Nanger dama assembly (accession: GCA_019969365.1):
#wget ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/jah/JAHTZZ01.fasta.gz
#wget ftp://ftp.ebi.ac.uk/pub/databases/ena/wgs/public/cak/CAKJTW01.fasta.gz

### for the human assembly (URL copied from the NCBI website
wget https://api.ncbi.nlm.nih.gov/datasets/v2/genome/accession/GCF_000001405.40/download?include_annotation_type=GENOME_FASTA&include_annotation_type=GENOME_GFF&include_annotation_type=RNA_FASTA&include_annotation_type=CDS_FASTA&include_annotation_type=PROT_FASTA&include_annotation_type=SEQUENCE_REPORT&hydrated=FULLY_HYDRATED


