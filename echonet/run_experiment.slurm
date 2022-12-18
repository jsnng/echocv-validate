#! /usr/bin/env bash 

#SBATCH --job-name=echonet
#SBATCH --output=y.o
#
#SBATCH --ntasks=10
#SBATCH --mem-per-cpu=1

#SBATCH --partition=a100

module purge 
module load Python/Python3.9

cd /rusers/postgrad/jng1/echocv-validate/echonet/dynamic/
# pip install --user .
# unzip EchoNet-Dynamic
# echo 'DATA_DIR = EchoNet-Dynamic/' > echonet.cfg
python3.9 echonet segmentation --save_video
