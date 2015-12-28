docker run -itd -v $(pwd)/go:/go -v /usr/local/cuda:/usr/local/cuda -p 2222:22 --name deep deep-learning /bin/bash
