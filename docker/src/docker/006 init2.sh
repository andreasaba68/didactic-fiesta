
sudo apk add git

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
