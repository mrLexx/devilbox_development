#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`/..

cd $SCRIPTPATH

./bin/stop.sh
./bin/up.sh
