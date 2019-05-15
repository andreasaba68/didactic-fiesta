
#"C:\Program Files\Notepad++\notepad++.exe" "C:\Windows\System32\Drivers\etc\hosts"

#Needed to actually install main virtual box on my host machine
#Started from "added vbox additions and shared  git folder"
#poweroff
#Configured network bridging (please also add 1GB RAM, +1CPU)
#started back

apk update
apk add	sudo
adduser docker
echo "docker    ALL=(ALL) ALL" >> /etc/sudoers

#connect through ssh now

sudo su
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' > /etc/apk/repositories; \
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories;
apk update

# Source: https://wiki.alpinelinux.org/wiki/Docker
# should be already done - Uncomment the "/edge/community" community repository in: vi /etc/apk/repositories

apk add curl
apk add screen
apk add docker

# Source: https://github.com/docker/compose/releases
#curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose

# should be run here: apk add docker-compose

rc-update add docker default
service docker start

mkdir /home/docker/hosts_dev
mount -t vboxsf dev /home/docker/hosts_dev
#cat /etc/group
#search for vboxsf group id (hopefully 102)
#echo "dev /home/docker/hosts_dev vboxsf uid=0,gid=102 0 0" >> /etc/fstab

mkdir /home/docker/.m2
cp /home/docker/hosts_dev/.m2/settings-alpine-vb.xml /home/docker/.m2/settings.xml

#now exit sudo - exit
