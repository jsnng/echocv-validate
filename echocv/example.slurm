#! /usr/bin/env bash 
#
#SBATCH --job-name=echocv
#SBATCH --output=z.o
#
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1

#SBATCH --partition=a100-dev

module purge 
module load cuda/cuda-11.0
module load anaconda/conda3 


cd /rusers/postgrad/jng1/
source .bashrc

cd echocv-validate/echocv/
conda activate .echocv/

python --version

cd master/
python --version
