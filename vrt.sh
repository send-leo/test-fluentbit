#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

function docker_compose_up {
  docker-compose -f $SCRIPT_PATH/docker-compose.yaml build --force-rm
  docker-compose -f $SCRIPT_PATH/docker-compose.yaml up --force-recreate
}

function docker_compose_down {
  docker-compose -f $SCRIPT_PATH/docker-compose.yaml down
}

function docker_attach {
  docker exec -it aaa /bin/bash
}

cmd=$1

case $cmd in
  up)
    docker_compose_up ;;
  down)
    docker_compose_down ;;
  attach)
    docker_attach ;;
  *)
    echo $"Usage: $0 {build|down|attach}"
    ;;
esac
