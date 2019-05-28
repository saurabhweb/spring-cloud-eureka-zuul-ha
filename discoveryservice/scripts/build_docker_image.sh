#!/bin/bash

# Usage: 
#eurekaserver $sh scripts/build_docker_image.sh eurekaserver-0.0.1-SNAPSHOT

BOOT_JAR_NAME=$1

mvn clean package

rm -rf docker/content
mkdir docker/content

cp target/${BOOT_JAR_NAME}.jar docker/content

docker build --build-arg BOOT_JAR=${BOOT_JAR_NAME} -t testspringapp docker
