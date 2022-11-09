#! /usr/bin/env bash

module purge
module load anaconda/conda3

git clone https://bitbucket.com/rahuldeo/echocv/src/master

if [ $? -eq 0 ]; then
	conda create -y -p "echocv" -c free python=2.7.11 anaconda
	conda activate "echocv"

	pip install --no-cache-dir -r echocv/requirements.txt
	pip install --no-cache-dir easydict==1.9
fi
