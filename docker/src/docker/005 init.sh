#do the following
#vi '~/005 init.sh'
#paste the content below
#sudo su
#. './005 init.sh'
#exit
#/etc/profile.d/java.sh

# AMI is an alpine/v3.6
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' > /etc/apk/repositories; \
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories; \
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories; \
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories;

apk add openjdk9-jdk
apk add maven
apk add git
#docker is already installed

echo 'export JAVA_HOME=/usr/lib/jvm/java-9-openjdk' > /etc/profile.d/java.sh; \
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile.d/java.sh;
chmod +x /etc/profile.d/java.sh

git config --global user.name 'Andrea Saba'
git config --global user.email 'andreasaba@gmail.com'
git config --global color.ui true
git init

git remote add origin git@github.com:andreasaba68/didactic-fiesta.git
#git remote -v
git clone https://github.com/andreasaba68/didactic-fiesta.git
cd /home/docker/didactic-fiesta
git pull

cd /home/docker/didactic-fiesta/docker/src/docker

docker image build --tag=alpinejava --file '010 alpine-java.Dockerfile' .
