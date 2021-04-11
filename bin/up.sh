#!/bin/bash

## OUTPUT=$(docker volume ls | grep devilbox_devilbox-rabbit)
## echo "${OUTPUT}"

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`/..
cd $SCRIPTPATH/
./bin/copy.sh
cd $SCRIPTPATH/devilbox
docker-compose up -d