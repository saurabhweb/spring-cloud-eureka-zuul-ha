#!/bin/bash

# Run multiple instances of a service
# Usage 
# Run on port 8081
# service-parent> sh scripts/deploy_standalone.sh accountservice 1
# Run on port 8082
# service-parent> sh scripts/deploy_standalone.sh accountservice 2


SERVICE=$1
INSTANCE=$2

case "$SERVICE" in
  "gatewayservice") PORT="900${INSTANCE}" ;;
  "accountservice") PORT="910${INSTANCE}" ;;
  "customerservice") PORT="920${INSTANCE}" ;;
  "orderservice") PORT="930${INSTANCE}" ;;
  *) echo "BAD SERVICE"
     exit 1 ;;
esac

BOOT_JAR="${SERVICE}-0.0.1-SNAPSHOT.jar"
#PORT="${PORT_PREF}${INSTANCE}"
echo "PORT=${PORT}"



#mvn clean package
java -jar -Dspring.profiles.active=standalone -Dservice.port=${PORT} ${SERVICE}/target/${SERVICE}-0.0.1-SNAPSHOT.jar


