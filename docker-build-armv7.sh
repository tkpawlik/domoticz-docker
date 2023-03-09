#!/bin/bash

source domoticz.properties
docker build -t domoticz:$version .