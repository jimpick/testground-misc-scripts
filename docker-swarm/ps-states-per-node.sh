#! /bin/bash

docker service ls | awk '{ print $1 }' | grep -v ID | xargs docker service ps | awk '{ print $4 $5 }' | grep -v DESIRED | sort | uniq -c
