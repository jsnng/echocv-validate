#! /usr/bin/env bash

cd "$HOME/echocv"
find . -type f | while read x ; do 
    if file -i "${x}" | grep -q x-python ; then
        cat "${x}" | grep -n sys.path.append
        if [ $? -eq 0 ]; then
            echo "${x}"
        fi
    fi
done    
cp echoanalysis_tools.py echoanalysis_tools.py.old
cat echoanalysis_tools.py | sed "s/\/home\/rdeo\/anaconda\/lib\/python2.7\/site-packages\//\/rusers\/postgrad\/jng1\/.conda\/pkgs\//" > echoanalysis_tools.py