#!/bin/bash
docker rm integrichain_container
cat jdka* > jdk-7u80-linux-x64.tar.gz
echo "127.0.0.1       localhost.integrichain.com" >> /etc/hosts
echo "path to dna-om"
read path_dna_om
docker build --no-cache -t integrichain .
docker build -t integrichain .
DOCKER_COMMAND="docker run --name integrichain_container -p 3306:3306 -p 8080:8080 -p 8081:8081 -p 9000:9000 -p 9001:9001 -v /tmp/order850_rt:/var/data/IN/order850_rt -v $HOME/.m2/:/root/.m2/ -v $path_dna_om:/dna-om integrichain bash /start.bash"
$DOCKER_COMMAND
rm jdk-7u80-linux-x64.tar.gz
