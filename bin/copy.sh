#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`/..

cd $SCRIPTPATH/devilbox/

git check-ignore $(find . -type f -print) | grep "./cfg/\|./autostart/" | xargs rm
rm -rf ./.env
rm -rf ./docker-compose.override.yml


cd $SCRIPTPATH
cp -a -v ./config/. ./devilbox/