docker run -itd -v $(pwd)/go:/go -v /usr/local/cuda:/usr/local/cuda -p 2222:22 --name cfc caffe-cuda /bin/bash
