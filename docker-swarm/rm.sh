#! /bin/bash

docker service ls | awk '{ print $1 }' | grep -v ID | xargs docker service rm
