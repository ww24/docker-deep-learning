# add GPU Support
docker run -itd --device /dev/nvidiactl --device /dev/nvidia0 --device /dev/nvidia-uvm -v $(pwd)/data:/root/data -p 6006:6006 --name deep-gpu ww24/deep-learning
