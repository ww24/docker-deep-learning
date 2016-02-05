Docker Deep Learning
====================

[![imagelayers.io][imagelayers-img]][imagelayers-url]

Caffe, Chainer, TensorFlow の環境が数分で整います。

Docker host が NVIDIA GPU を積んでいれば、 CUDA と cuDNN も利用可能です。

Requirements
------------
* NVIDIA GPU
* Docker

Environment
-----------
* Essential environment (python, curl, wget, git, nano, vim, etc...)
* CUDA
* cuDNN
* Caffe
* Chainer
* TensorFlow

Get started
-----------
Pull from [Docker Hub](https://hub.docker.com/r/ww24/deep-learning/)

```
docker pull ww24/deep-learning
```

Use [NVIDIA Docker wrapper](https://github.com/NVIDIA/nvidia-docker#nvidia-docker-wrapper)

```
GPU=0 ./nvidia-docker run -itd -v $(pwd)/data:/root/data -p 6006:6006 --name deep ww24/deep-learning
```

[imagelayers-url]: https://imagelayers.io/?images=ww24/deep-learning:latest
[imagelayers-img]: https://badge.imagelayers.io/ww24/deep-learning:latest.svg
