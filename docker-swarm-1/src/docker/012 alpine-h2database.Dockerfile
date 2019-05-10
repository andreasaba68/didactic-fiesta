FROM alpinejava:latest

RUN mkdir /usr/lib/h2/

COPY ./h2/bin/h2*.jar /usr/lib/h2/

#exposes the web server port to allow testing
EXPOSE 8082

CMD ["java", "-cp", "/usr/lib/h2/*.jar", "org.h2.tools.Server" ]
