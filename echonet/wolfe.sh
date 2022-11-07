#! /usr/bin/env bash

git clone https://github.com/echonet/dynamic
cd "$(realpath .)/dynamic"

#cat requirements.txt | sed s'/echonet==1.0.0"//' | xargs -n 1 pip install --quiet
#pip install click

mkdir "$(realpath .)/models"
wget -P models/ https://github.com/douyang/EchoNetDynamic/releases/download/v1.0.0/deeplabv3_resnet50_random.pt 
wget -P models/ https://github.com/douyang/EchoNetDynamic/releases/download/v1.0.0/r2plus1d_18_32_2_pretrained.pt
