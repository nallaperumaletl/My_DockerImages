#Convert the all .sh to dos2unix format: saferside
find . -type f -name "*.sh" -exec dos2unix {} \;
#Create network
docker network create -d bridge bds-network
#Create hadoop base image
cd hadoop/base && docker build . -t hadoop-base && cd ../..
#Create spark base image
cd spark/base && docker build . -t spark-base && cd ../..
#Start all containers
docker-compose up