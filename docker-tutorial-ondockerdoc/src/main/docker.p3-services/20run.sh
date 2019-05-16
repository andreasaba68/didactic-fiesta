
#docker swarm init

docker stack deploy -c docker-compose.yml getstartedlab
docker service ps getstartedlab_web

curl -4 http://localhost:4000 > curl.txt
echo "" >> curl.txt
curl -4 http://localhost:4000 >> curl.txt
echo "" >> curl.txt
curl -4 http://localhost:4000 >> curl.txt
echo "" >> curl.txt
curl -4 http://localhost:4000 >> curl.txt
echo "" >> curl.txt

