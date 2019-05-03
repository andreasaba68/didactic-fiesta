
# AMI is an alpine/v3.6
sudo echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/main" > /etc/apk/repositories; \
sudo echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories; \
sudo echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
sudo echo "http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories; \
sudo echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories;

sudo apk add openjdk9-jdk
sudo apk add maven
sudo apk add git
#docker is already installed

docker build --tag=alpinejava --file './010 alpine-java.Dockerfile" .

git config --global user.name "Andrea Saba"
git config --global user.email "andreasaba@gmail.com"
git config --global color.ui true

git init
git remote add origin git@github.com:andreasaba68/didactic-fiesta.git
#git remote -v
git clone https://github.com/andreasaba68/didactic-fiesta.git
