
#. ~/didactic-fiesta/docker-swarm-1/src/docker/007\ build.sh

# *** Building the base image (alpine + java)
cd ~/didactic-fiesta/docker-swarm-1
docker image build . --tag alpinejava --file './src/docker/010 alpine-java.Dockerfile'

# *** Creating the deployment image
mvn package -Dmaven.test.skip=true
docker build . --tag=alpinejavaswarm --file './src/docker/015 docker-swarm.Dockerfile'

# *** Creating the services, ~/data is needed for visualizer service
docker swarm init
mkdir ~/data

docker stack deploy -c './src/docker/070 docker-compose.yml' dockerswarm1

docker service update --publish-add published=8080,target=8080 dockerswarm1
