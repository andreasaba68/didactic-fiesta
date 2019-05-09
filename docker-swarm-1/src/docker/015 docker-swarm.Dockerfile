FROM alpinejava:latest

RUN apk add curl

COPY target/docker-swarm-1-0.0.1-SNAPSHOT.jar /usr/src/docker-swarm-1-0.0.1-SNAPSHOT.jar

EXPOSE 8081

CMD ["java", "-jar", "/usr/src/docker-swarm-1-0.0.1-SNAPSHOT.jar", \
	"-J-XX:+UnlockExperimentalVMOptions", \
    "-J-XX:+UseCGroupMemoryLimitForHeap", \
    "-R-XX:+UnlockExperimentalVMOptions", \
    "-R-XX:+UseCGroupMemoryLimitForHeap"]
