#!/bin/bash

# Runs the eurekaserver discovery server in a HA/replicated mode on a local machine.
# Essentially, runs java command passing it environment variables that are substituted in the application.yml.
# 
# Starts each server on different ports. See _PORTS
# Eureka server requires each instance url to have a different hostname

# Run this script separately to start-up each instance.

# Open terminal, cd eurekaserver
# eurekaserver> sh scripts.deploy_ha.sh 1

# Open terminal, cd eurekaserver
# eurekaserver> sh scripts.deploy_ha.sh 3

# Open terminal, cd eurekaserver
# eurekaserver> sh scripts.deploy_ha.sh 3

# Which instance. Essentially used to index into the HOSTS, PORTS array.
_INSTANCE=$1

# Needs to match the profile declared in application.yml
SPRING_PROFILE="ha"


declare -a _PORTS=("8761" "8762" "8763")

# Eureka server requires each instance url to have a different hostname
declare -a _HOSTNAMES=("localhost" "localhost.castlighthealth.com" "api.localhost")

# Array indexes start with 0, so helps for comparison
INST_IDX=$((_INSTANCE-1))

_LEN=${#_HOSTNAMES[@]}
LAST_IDX=$((_LEN-1))

SERVER_PORT=${_PORTS[${INST_IDX}]}
SERVER_HOSTNAME=${_HOSTNAMES[${INST_IDX}]}
SERVICE_URLS=""

# Build the other faiover URLs.
# The property should not contain the current servers URL.
for i in "${!_HOSTNAMES[@]}"; do
	SEP=","
	
	# We dont want the URL string to start with a comma
	# Dont use comma separator if this is the first host OR if no URLs have been appended yet.
	if [ "${i}" -eq "0" ] || [ -z "${SERVICE_URLS}"  ]; then
		SEP=""
	fi

	# For all other hosts, except current one, append the URL.
	if [ "${i}" -ne "${INST_IDX}" ]; then
		SERVICE_URLS="${SERVICE_URLS}${SEP}http://${_HOSTNAMES[$i]}:${_PORTS[$i]}/eureka/"
	fi

done

echo "SERVICE_URLS=${SERVICE_URLS}"
echo "SERVER_HOSTNAME=${SERVER_HOSTNAME}"
echo "SERVER_PORT=${SERVER_PORT}"


java -jar \
	-Dspring.profiles.active=${SPRING_PROFILE} \
	-Dservice.port=${SERVER_PORT} \
	-Ddiscovery.instance.hostname=${SERVER_HOSTNAME} \
	-Ddiscovery.fallback.urls=${SERVICE_URLS} \
	target/eurekaserver-0.0.1-SNAPSHOT.jar
