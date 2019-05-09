FROM alpine:3.9.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.9/main" > /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.9/community" >> /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories;

RUN apk update
RUN apk add openjdk9-jre

# Set up env variables
ENV JAVA_HOME=/usr/lib/jvm/java-9-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

CMD ["/bin/echo", "hello world"]
