#!/bin/bash
#stageone_tasks 

wget https://raw.githubusercontent.com/HackBio-Internship/wale-home-tasks/main/DNA.fa
ls
grep -c "^>" DNA.fa
grep -v "^>" DNA.fa | wc -c

#setting up a miniconda environment

wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh
bash Miniconda3-py39_4.12.0-Linux-x86_64.sh

#installing three software 

conda install -c bioconda fastqc
conda install -c bioconda fastp
conda install -c bioconda seqtk

#making a folder "datasets" to put all the files and subfolders

mkdir datasets 
mkdir raw_reads

cd datasets
cd raw_reads 

#installing all the files for fastqc report in the raw_reads

wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R1.fastq.gz?raw=true -O ACBarrie_R1.fastq.gz 
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R2.fastq.gz?raw=true -O ACBarrie_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R1.fastq.gz?raw=true -O Alsen_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R2.fastq.gz?raw=true -O Alsen_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Baxter_R1.fastq.gz?raw=true -O Baxter_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Baxter_R2.fastq.gz?raw=true -O Baxter_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R1.fastq.gz?raw=true -O Chara_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R2.fastq.gz?raw=true -O Chara_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Drysdale_R1.fastq.gz?raw=true -O Drysdale_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Drysdale_R2.fastq.gz?raw=true -O Drysdale_R2.fastq.gz

ls
cd ../

#make a folder for the fastqc results 

mkdir Fastqc_Reports

#applying the cmd for fastqc results 

fastqc raw_reads/ACBarrie_R1.fastq.gz -o Fastqc_Report/
fastqc raw_reads/ACBarrie_R2.fastq.gz -o Fastqc_Report/
fastqc raw_reads/Alsen_R1.fastq.gz -o Fastqc_Report/
fastqc raw_reads/Alsen_R2.fastq.gz -o Fastqc_Report/
fastqc raw_reads/Baxter_R1.fastq.gz -o Fastqc_Report/
fastqc raw_reads/Baxter_R2.fastq.gz -o Fastqc_Report/
fastqc raw_reads/Chara_R1.fastq.gz -o Fastqc_Report/
fastqc raw_reads/Chara_R2.fastq.gz -o Fastqc_Report/
fastqc raw_reads/Drysdale_R1.fastq.gz -o Fastqc_Report/
fastqc raw_reads/Drysdale_R2.fastq.gz -o Fastqc_Report/

#upload raw dataset for fastp analysis

nano trim.sh 
cp trim. sh raw_reads/
cd raw_reads
ls

bash trim.sh
ls

#change the name qc_reads from trimmed_reads

mv qc_reads trimmed_reads
ls 
cd trimmed_reads
ls
cd ../

mkdir Converted_Fasta

#converting fastq to fasta using seqtk

seqtk seq -a ACBarrie_R1.fastq.gz > ACBarrie_R1.fa
seqtk seq -a ACBarrie_R2.fastq.gz > ACBarrie_R2.fa
seqtk seq -a Alsen_R1.fastq.gz > Alsen_R1.fa
seqtk seq -a Alsen_R2.fastq.gz > Alsen_R2.fa
seqtk seq -a Baxter_R1.fastq.gz > Baxter_R1.fa
seqtk seq -a Baxter_R2.fastq.gz > Baxter_R2.fa
seqtk seq -a Chara_R1.fastq.gz > Chara_R1.fa
seqtk seq -a Chara_R2.fastq.gz > Chara_R2.fa
seqtk seq -a Drysdale_R1.fastq.gz > Drysdale_R1.fa
seqtk seq -a Drysdale_R2.fastq.gz > Drysdale_R2.fa

mv *.fa Converted_Fasta
cd ../

#make an Output folder for all the results 

mkdir Output

#move the resuls to Output folder

mv raw_reads Output
mv Fastqc_Report Output

ls Output -lh

cd ../../

#end








