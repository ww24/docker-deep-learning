Docker Deep Learning
====================

卒研環境

Requirements
------------
* NVIDIA GPU
* Docker

Environment
-----------
* Essential environment (python, curl, wget, git, nano, vim, openssh-server, etc...)
* CUDA
* cuDNN
* Caffe
* Tensorflow
* Chainer

Get started
-----------
Pull from [Docker Hub](https://hub.docker.com/r/ww24/deep-learning/)

```
docker pull ww24/deep-learning
```

Use [NVIDIA Docker wrapper](https://github.com/NVIDIA/nvidia-docker#nvidia-docker-wrapper)

```
GPU=0 ./nvidia-docker run -itd -v $(pwd)/data:/root/data -p 2222:22 -p 6006:6006 --name deep ww24/deep-learning /bin/bash
```
