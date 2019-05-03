
mvn archetype:generate -DgroupId=org.examples.java -DartifactId=helloworld -DinteractiveMode=false

cd helloworld
mvn package

docker build --tag=alpinejavatest --file '../015 helloworld.Dockerfile" .
