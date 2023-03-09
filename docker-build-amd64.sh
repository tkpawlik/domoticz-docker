#!/bin/bash

source domoticz.properties
docker buildx build --platform linux/arm/v7 -t domoticz:$version .
docker save domoticz:$version > domoticz-$version.tar