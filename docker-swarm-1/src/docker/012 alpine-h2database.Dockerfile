FROM alpinejava:latest

COPY target/docker-swarm-1-0.0.1-SNAPSHOT.jar /usr/src/docker-swarm-1-0.0.1-SNAPSHOT.jar

#exposes the web server port to allow testing
EXPOSE 8082

CMD ["java", "-cp", "org.h2.tools.Server", \
	"-J-XX:+UnlockExperimentalVMOptions", \
    "-J-XX:+UseCGroupMemoryLimitForHeap", \
    "-R-XX:+UnlockExperimentalVMOptions", \
    "-R-XX:+UseCGroupMemoryLimitForHeap"]
