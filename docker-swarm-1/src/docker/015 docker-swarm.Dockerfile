FROM alpinejava:latest

COPY target/docker-swarm-1-0.0.1-SNAPSHOT.jar /usr/src/docker-swarm-1-0.0.1-SNAPSHOT.jar

CMD java -cp /usr/src/docker-swarm-1-0.0.1-SNAPSHOT.jar it.asaba.sdev.dockerswarm1.DockerSwarm1Application