#!/bin/bash

docker image rm -f domoticz:1.2.0
docker build -t domoticz:1.2.0 .
docker image ls | grep domoticz