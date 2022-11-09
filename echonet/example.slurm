#! /usr/bin/env bash 

#SBATCH --partition=a100
#SBATCH -p cpu 
#SBATCH -n 16 
#SBATCH --job-name=echonet
#SBATCH --output logs/%x.%N.%j.out 
#SBATCH --error logs/%x.%N.%j.err 
module purge 
module load anaconda/conda3 

conda activate "$(realpath .)/.echonet/"
python dynamic/echonet.py
