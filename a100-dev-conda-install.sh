!# /usr/bin/env bash

```
module load anaconda/conda3
```

cd "/bigdata/users/postgrad/jng1/"
[ ! -d ".conda/dev/" ] && mkdir -p "./conda/dev/"
conda create -y -p ".conda/dev/echocv" -c free python=2.7.11 anaconda
conda activate "~/.conda/dev/echocv"

git clone https://bitbucket.com/rahuldeo/echocv/src/master
pip install --no-cache-dir -r echocv/requirements.txt
pip install --no-cache-dir easydict==1.9