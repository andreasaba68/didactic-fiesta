#do the following
#vi './005 init.sh'
#paste the content below

#vi './006 init2.sh'
#paste the content within the script

#sudo su
#. './005 init.sh'
#exit
#. /etc/profile.d/java.sh
#. '006\ init2.sh'

echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories; \
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories;

apk update
apk add openjdk9-jdk
#docker is already installed

#NO apk add maven as it adds jdk 8 dependency
wget http://it.apache.contactlab.it/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
tar -xzvf apache-maven-3.6.1-bin.tar.gz -C /usr/lib

echo 'export M2_HOME=/usr/lib/apache-maven-3.6.1' > /etc/profile.d/java.sh; \
echo 'export JAVA_HOME=/usr/lib/jvm/java-9-openjdk' >> /etc/profile.d/java.sh; \
echo 'export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin' >> /etc/profile.d/java.sh;
chmod +x /etc/profile.d/java.sh
