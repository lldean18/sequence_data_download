#!/bin/bash
# Laura Dean
# 18/7/25
# script written for running on the UoN HPC Ada

#SBATCH --job-name=ENA_raw_file_download
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5g
#SBATCH --time=2:00:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out

# set variables
wkdir=/gpfs01/home/mbzlld/data # working directory where your information files are stored and where you will download the data to
accession=ERR12834984 # the run accession number for the file you wish to download

# move to the working dir
cd $wkdir

###### get the ftp file location for the file you want to download using the accession number
curl "https://www.ebi.ac.uk/ena/portal/api/filereport?accession=$accession&result=read_run&fields=submitted_ftp,submitted_format&format=tsv" >> ftp_path.txt
# modify the tsv file so that it contains only the url
cut -f3 ftp_path.txt > tmp && mv tmp ftp_path.txt # remove the first column of accessions
sed -i '1d' ftp_path.txt # remove header lines
sed -i 's/;/\n/g' ftp_path.txt # if there are multiple urls on the same line (e.g.) for paired forward and reverse reads split them onto single lines


###### download the files from the urls
wget --input-file=ftp_path.txt

echo "wget command has finished"

