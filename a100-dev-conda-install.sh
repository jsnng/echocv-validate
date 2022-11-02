! /bin/bash

root="/bigdata/users/jng1/"
conda="$root.conda/dev/echocv"

cd "$root"
git clone https://bitbucket.com/rahuldeo/echocv/src/master
[ ! -d "$conda" ] && mkdir -p "$conda"
conda create -y -p "$conda" -c free python=2.7.11 anaconda
conda activate "$conda"
pip install --no-cache-dir -r echocv/requirements.txt
