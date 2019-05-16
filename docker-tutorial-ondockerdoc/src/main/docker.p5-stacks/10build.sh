
#eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env myvm1)
#eval $(docker-machine env myvm1)

docker-machine ssh myvm1 "mkdir ./data"

docker stack deploy -c docker-compose.yml getstartedlab
