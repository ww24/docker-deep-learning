FROM ubuntu:trusty
MAINTAINER Takenori Nakagawa

# upgrade packages
RUN apt-get update
RUN apt-get upgrade -y

# expose portes
EXPOSE 22

# install dependent packages
RUN apt-get install -y openssh-server curl wget git vim-nox nano build-essential
RUN apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libatlas-base-dev python-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler

# golang 1.5
# http://floaternet.com/golang/godeb
RUN wget -O godeb.tar.gz https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
RUN tar xzvf godeb.tar.gz
RUN ./godeb install 1.5

# setup cuda repository
RUN wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
RUN rm -f cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
RUN apt-get update
RUN apt-get install -y cuda

# cudnn (skip)
#RUN cp lib64/* /usr/local/cuda-7.5/lib64
#RUN cp include/* /usr/local/cuda-7.5/include

# add user
RUN useradd -m caffe
RUN echo caffe:caffe | chpasswd
RUN gpasswd -a caffe sudo

# set env
ENV PATH /usr/local/cuda/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV GOPATH /go
ENV PATH=$PATH:$GOPATH/bin:/usr/local/cuda/bin

# install caffe
WORKDIR /home/caffe
RUN git clone https://github.com/BVLC/caffe.git
WORKDIR /home/caffe/caffe
RUN cp Makefile.config.example Makefile.config
#RUN make all

# change owner and group
RUN chown -R caffe /home/caffe
RUN chgrp -R caffe /home/caffe

# set workdir
VOLUME ["/go"]
WORKDIR /go

# set docker init script
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
ENTRYPOINT ["/usr/local/bin/init.sh"]
