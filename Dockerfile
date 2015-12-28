FROM nvidia/cuda:7.0-cudnn2-runtime
MAINTAINER Takenori Nakagawa

# upgrade packages
RUN apt-get update
RUN apt-get upgrade -y

# expose portes
EXPOSE 22

# install dependent packages
RUN apt-get install -y curl wget git vim-nox nano build-essential
RUN apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libatlas-base-dev python-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler

# golang 1.5
# http://floaternet.com/golang/godeb
RUN wget -O godeb.tar.gz https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
RUN tar xzvf godeb.tar.gz
RUN ./godeb install 1.5

# set env
ENV PATH /usr/local/cuda/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV GOPATH /go
ENV PATH=$PATH:$GOPATH/bin:/usr/local/cuda/bin:/root/caffe/build/tools
ENV PYTHONPATH=/root/caffe/python:$PYTHONPATH

# install caffe
WORKDIR /root
RUN git clone -depth 1000 https://github.com/BVLC/caffe.git
WORKDIR /root/caffe
RUN cp Makefile.config.example Makefile.config
RUN make all

# install usual packages and modules
RUN apt-get install -y imagemagick python-pip python-numpy gfortran
RUN pip install --upgrade pip
RUN pip install scipy pydot
RUN pip install -r /root/caffe/python/requirements.txt

# set workdir
VOLUME ["/go"]
WORKDIR /root

# set docker init script
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
ENTRYPOINT ["/usr/local/bin/init.sh"]
