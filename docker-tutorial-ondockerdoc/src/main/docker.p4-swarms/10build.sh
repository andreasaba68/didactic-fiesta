
#Creates 2 vms with docker within them (2 docker machines?)
#docker-machine create --driver virtualbox myvm1
#docker-machine create --driver virtualbox myvm2

#check and get the ip address from the node we wish to elect to manager
#docker-machine ls

#election
#docker-machine ssh myvm1 "docker swarm init --advertise-addr 192.168.99.100"

#tells vm2 to join the swarm as a worker
#docker-machine ssh myvm2 "docker swarm join --token SWMTKN-1-31yi7maierwm53vdmjj7hifzef9mo2tmwuunutzbk41qgivw7j-bbcbct0r08o8r616woft08rdb 192.168.99.100:2377"

#just to check
#docker-machine ssh myvm1 "docker node ls"

#sets up the shell to talk with vm1
#docker-machine env myvm1
#eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env myvm1)

#docker-machine ls
#docker service ps getstartedlab_web

#docker stack deploy -c docker-compose.yml getstartedlab
#docker service ps getstartedlab_web

eval $(docker-machine env -u)

#Leaving the swarm and removing it
#docker-machine ssh myvm2 "docker swarm leave"
#docker-machine ssh myvm1 "docker swarm leave --force"
#docker stack rm getstartedlab


