#!/bin/bash

mvn clean package
java -jar target/configserver-0.0.1-SNAPSHOT.jar


#java -jar -Dspring.profiles.active=native target/configserver-0.0.1-SNAPSHOT.jar
