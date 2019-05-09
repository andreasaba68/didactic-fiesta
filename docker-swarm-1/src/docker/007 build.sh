
#. ~/didactic-fiesta/docker-swarm-1/src/docker/007\ build.sh

# *** Building the base image (alpine + java)
cd ~/didactic-fiesta/docker-swarm-1
docker image build . --tag alpinejava --file './src/docker/010 alpine-java.Dockerfile'

# *** Creating the deployment image
mvn package -Dmaven.test.skip=true
docker build . --tag=alpinejavaswarm --file './src/docker/015 docker-swarm.Dockerfile'

# *** Creating the services, ~/data is needed for visualizer service
docker swarm init

docker stack deploy -c './src/docker/070 docker-compose.yml' dockerswarm1

#docker run -p 8081:8081 alpinejavaswarm
#docker swarm join --token SWMTKN-1-1j3x29v9ollequal9t75xbo8wo40q8d7mnwle274ezfj6fb8ah-azvnw0tvhaturqlxulyltpfy7 192.168.43.27:2377
docker image ls
docker exec -ti dockerswarm1_web.1.hpbmm9zpu3gqp6fesq8oo10nx /bin/ash

#sudo apk add docker-compose
#source https://wiki.alpinelinux.org/wiki/Docker#Docker_Compose
#apk add py-pip
#apk add python-dev libffi-dev openssl-dev gcc libc-dev make
#pip install docker-compose
#docker-compose up -d -f './src/docker/070 docker-compose.yml'


docker service update --publish-add published=8080,target=8080 dockerswarm1_visualizer
docker service update --publish-add published=8081,target=8081 dockerswarm1_web
