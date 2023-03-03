#!/bin/bash

docker rm -f domoticz
docker image rm -f domoticz:1.1.0
docker build -t domoticz:1.1.0 .
docker image ls | grep domoticz
