#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`/..

cd $SCRIPTPATH/devilbox
./shell.sh