#cd ~/didactic-fiesta/docker/src/docker

cd helloworld
mvn package

docker build . --tag=alpinejavatest --file '../015 helloworld.Dockerfile'
