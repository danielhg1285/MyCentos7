#!/usr/bin/env bash

instance=${1:?}

if docker ps -a | grep -q $instance; then
  ./appollo-stop.sh $instance
fi

docker rm stack${instance}_dbbackup_1

docker-compose -p stack$instance down -v

if docker volume ls | grep -q stack${instance}_ ; then
   docker volume ls | grep stack${instance}_ | awk '{ print $2 }' | xargs docker volume rm
fi
