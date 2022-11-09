#! /usr/bin/env bash

module purge
module load anaconda/conda3

git clone https://bitbucket.com/rahuldeo/echocv/src/master

conda create -y -p "echocv" -c free python=2.7.11 anaconda
conda activate "$(realpath .)/echocv/"

pip install --no-cache-dir -r master/requirements.txt
pip install --no-cache-dir easydict==1.9

wget -O data.zip https://www.dropbox.com/sh/0tkcf7e0ljgs0b8/AACBnNiXZ7PetYeCcvb-Z9MSa?dl=0
