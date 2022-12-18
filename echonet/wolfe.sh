#! /usr/bin/env bash

module purge
module load Python/Python3.9

git clone https://github.com/echonet/dynamic 

cd "$(realpath .)/dynamic"
pip install .

mkdir "$(realpath .)/dynamic/models"
wget -P models/ https://github.com/douyang/EchoNetDynamic/releases/download/v1.0.0/deeplabv3_resnet50_random.pt 
wget -P models/ https://github.com/douyang/EchoNetDynamic/releases/download/v1.0.0/r2plus1d_18_32_2_pretrained.pt

if [ -f "EchoNet-Dynamic.zip" ] && unzip EchoNet-Dynamic.zip
echo 'DATA_DIR = EchoNet-Dynamic/' > echonet.cfg