#! /usr/bin/env bash

module purge
module load anaconda/conda3

git clone https://github.com/echonet/dynamic 
conda create -p ".echonet" -y -c conda-forge python=3.8.1 anaconda
conda activate "$(realpath .)/.echonet/"

cat dynamic/requirements.txt | sed "s/echonet==1.0.0//" | xargs -n 1 pip install --no-cache-dir 
pip install click

mkdir "$(realpath .)/dynamic/models"
wget -P models/ https://github.com/douyang/EchoNetDynamic/releases/download/v1.0.0/deeplabv3_resnet50_random.pt 
wget -P models/ https://github.com/douyang/EchoNetDynamic/releases/download/v1.0.0/r2plus1d_18_32_2_pretrained.pt
