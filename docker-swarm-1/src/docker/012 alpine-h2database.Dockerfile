FROM alpinejava:latest

ADD ./h2/bin/h2*.jar /home/docker

#exposes the web server port to allow testing
EXPOSE 8082

CMD ["java", "-cp", "/home/docker/h2*.jar","org.h2.tools.Server", \
	"-J-XX:+UnlockExperimentalVMOptions", \
    "-J-XX:+UseCGroupMemoryLimitForHeap", \
    "-R-XX:+UnlockExperimentalVMOptions", \
    "-R-XX:+UseCGroupMemoryLimitForHeap"]
