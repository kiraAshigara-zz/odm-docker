#!/bin/bash
sudo echo "127.0.0.1       localhost.integrichain.com" >> /etc/hosts
echo "path to dna-om"
read path_dna_om
docker build --no-cache -t integrichain .
DOCKER_COMMAND="docker run -ti -p 8080:8080 -p 8081:8081 -v /tmp/order850_rt:/var/data/IN/order850_rt -v /tmp/ingrichain_m2:/root/.m2/ -v $path_dna_om:/dna-om integrichain bash /start.bash"
echo $DOCKER_COMMAND > start-container.sh
chmod a+x start-container.sh
