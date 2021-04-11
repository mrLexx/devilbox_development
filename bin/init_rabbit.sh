#!/bin/bash

countdown() {
  secs=$1
  shift
  msg=$@
  while [ $secs -gt 0 ]
  do
    printf "\r\033[KWaiting %.d seconds $msg" $((secs--))
    sleep 1
  done
  echo
}



SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`/..

cd $SCRIPTPATH
./bin/stop.sh

docker volume rm devilbox_devilbox-rabbit

cd $SCRIPTPATH
./bin/up.sh

countdown 30

cd $SCRIPTPATH/devilbox
docker-compose exec rabbit bash -l -c "rabbitmqctl add_vhost jr;exit"
#docker-compose exec rabbit bash -l -c "rabbitmqctl add_user jr 123;exit"
#docker-compose exec rabbit bash -l -c "rabbitmqctl set_permissions -p jr jr \".*\" \".*\" \".*\";exit"
docker-compose exec rabbit bash -l -c "rabbitmqctl set_permissions -p jr guest \".*\" \".*\" \".*\";exit"

docker-compose exec rabbit bash -l -c "rabbitmqctl add_vhost wiweb.jp;exit"
docker-compose exec rabbit bash -l -c "rabbitmqctl set_permissions -p wiweb.jp guest \".*\" \".*\" \".*\";exit"