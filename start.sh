# without GPU Support
docker run -itd -v $(pwd)/data:/root/data -p 2222:22 -p 6006:6006 --name deep ww24/deep-learning /bin/bash
