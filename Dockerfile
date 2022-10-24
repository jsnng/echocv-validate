FROM python:2.7.18
RUN git clone https://bitbucket.org/rahuldeo/echocv.git
WORKDIR /echocv
# RUN cat requirements.txt | sed 's/opencv-python==3.4.2.17/opencv-contrib-python==3.4.2.17/g' | xargs -n 1 pip install
