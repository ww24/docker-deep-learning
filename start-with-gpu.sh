# add GPU Support
docker run -itd --device /dev/nvidiactl --device /dev/nvidia0 --device /dev/nvidia-uvm -v $(pwd)/go:/go -v /usr/local/cuda:/usr/local/cuda -p 2222:22 --name deep-gpu deep-learning /bin/bash
