#!/bin/bash

docker-compose -f mongo-replica-docker-compose.yml up -d

#sleep 5

#docker exec -it mongo-primary /scripts/rs-init.sh