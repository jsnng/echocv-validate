FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
RUN apt-get -y update
RUN apt-get -y install python-dev python2.7 wget git
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python2.7 get-pip.py
RUN git clone https://bitbucket.org/rahuldeo/echocv.git
WORKDIR /echocv
RUN pip install -r requirements.txt