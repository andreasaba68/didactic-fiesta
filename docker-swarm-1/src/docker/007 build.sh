
#. ~/didactic-fiesta/docker-swarm-1/src/docker/007\ build.sh

# *** Building the base image (alpine + java)
sudo mount -t vboxsf dev /home/docker/hosts_dev
cd ~/didactic-fiesta/docker-swarm-1
git pull
docker image build . --tag alpinejava --file './src/docker/010 alpine-java.Dockerfile'

#wget http://www.h2database.com/h2-2019-03-13.zip
#unzip ../h2-2019-03-13.zip h2*.jar
docker image build . --tag alpineh2database --file './src/docker/012 alpine-h2database.Dockerfile'

# *** Creating the deployment image
mvn package -Dmaven.test.skip=true
docker build . --tag=alpinejavaswarm --file './src/docker/015 docker-swarm.Dockerfile'

# *** Creating the services, ~/data is needed for visualizer service
#docker swarm init

docker stack deploy -c './src/docker/070 docker-compose.yml' dockerswarm1

#correct way:
docker node ls
#get the manager (*red) id then:
docker node inspect --format '{{.Status.Addr}}' <the id e.g. t4leolv16u2jqw7kdsfvk3x7h>
#take the ip address and then you can
curl -4 http://the.ip.addr.ess:8081/session/write?test=pioppino
curl -4 http://the.ip.addr.ess:8081/session/write?test=pioppino
curl -4 http://alpine-vbox:8081/session/write?test=pioppino

#take the DefaultDNSTarget from CloudFormation's "Outputs" tab and use it similarly e.g.
curl -4 http://Docker-ExternalLoa-8L1FZ6572MMM-2059149846.sa-east-1.elb.amazonaws.com/session/write?test=pioppino


mvn test -Dtest=DockerSwarm1ApplicationTests2#testDeployedOn2NodesClusterWOSessionStickness -DbaseUrl=http://alpine-vbox:8081



#commands used to debug, the problem was elsewhere though
#docker run -p 8081:8081 -m 200M --cpus=0.100 alpinejavaswarm
#docker container ls
#docker exec -ti CCC /bin/ash
#netstat -na | grep -i LISTEN
#curl http://127.0.0.1:8081/session/write?test=pioppino
http://192.168.43.27:8081/session/write?test=pioppino

#docker service update --publish-add published=8080,target=8080 dockerswarm1_visualizer
#docker service update --publish-add published=8081,target=8081 dockerswarm1_web

#docker container ls
#docker exec -ti xenodochial_borg ifconfig
curl -4 http://172.17.0.6:8081/session/write?test=pioppino

