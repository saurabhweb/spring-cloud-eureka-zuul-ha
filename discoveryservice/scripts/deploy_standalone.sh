#!/bin/bash

mvn clean package
java -jar -Dspring.profiles.active=standalone target/eurekaserver-0.0.1-SNAPSHOT.jar
