FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
RUN apt-get -y update
RUN apt-get -y install python-dev python3.8 python3-pip git
RUN git clone https://github.com/echonet/dynamic.git
WORKDIR /dynamic
RUN cat requirements.txt | sed 's/echonet==1.0.0//' | xargs -n 1 pip3 install