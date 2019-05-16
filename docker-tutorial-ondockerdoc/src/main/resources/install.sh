
# Source: https://wiki.alpinelinux.org/wiki/Docker
# should be already done - Uncomment the "/edge/community" community repository in: vi /etc/apk/repositories

apk update
apk add curl
apk add docker

# Source: https://github.com/docker/compose/releases
curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

cp ./daemon.json /etc/docker/daemon.json
service docker start
docker swarm init

cp ./mount_goto.sh ~/.
