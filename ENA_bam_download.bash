#!/bin/bash
# Laura Dean
# 1/7/25
# script written for running on the UoN HPC Ada

#SBATCH --job-name=ENA_bam_download
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5g
#SBATCH --time=2:00:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out

# set variables
wkdir=/gpfs01/home/mbzlld/data/gazelle # working directory where your information files are stored and where you will download the data to
accessions=$wkdir/accessions.txt # text file containing a list of the accession numbers you wish to download


###### get a list of the ftp file locations for files you want to download using the list of accession numbers
cd $wkdir
# first create an empty file to write ftp paths to
touch ftp_paths.txt
# then loop over accession numbers and run the curl command to get file paths for each accession
while IFS= read -r line; do
    #curl "https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${line}&result=read_run&fields=fastq_ftp&format=tsv" >> ftp_paths.txt
    curl "https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${line}&result=read_run&fields=bam_ftp&format=tsv" >> ftp_paths.txt
done < $accessions
# modify the tsv file so that it contains only the urls
cut -f2 ftp_paths.txt > tmp && mv tmp ftp_paths.txt # remove the first column of accessions
sed -i '1~2d' ftp_paths.txt # remove header lines
sed -i 's/;/\n/g' ftp_paths.txt # if there are multiple urls on the same line (e.g.) for paired forward and reverse reads split them onto single lines


###### download the files from the urls
wget --input-file=ftp_paths.txt

echo "wget command has finished"

