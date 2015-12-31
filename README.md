Docker Deep Learning
====================

卒研環境

Requirements
------------
* NVIDIA GPU
* Docker

Environment
-----------
* CUDA
* cuDNN
* Caffe
* Tensorflow
* Chainer
* Go
* curl, wget, git, nano, vim, openssh-server, etc...

Get started
-----------
[NVIDIA Docker wrapper](https://github.com/NVIDIA/nvidia-docker#nvidia-docker-wrapper)

```
GPU=0 ./nvidia-docker run -itd -v $(pwd)/go:/go -p 2222:22 -p 6006:6006 --name deep deep-learning /bin/bash
```
