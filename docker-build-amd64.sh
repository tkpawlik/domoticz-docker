#!/bin/bash

# ./docker-build-amd64.sh /home/tkpawlik/Dropbox/repository

REPOSITORY=$1
VERSION=1.9.0

mkdir tmp
cp $REPOSITORY/domoticz_linux_armv7l.tgz tmp/
cp $REPOSITORY/libssl1.0.0_1.0.1t-1+deb8u7_armhf.deb tmp/
cp $REPOSITORY/wiringpi_2.50_armhf.deb tmp/
cp $REPOSITORY/dht22.bin tmp/
cp $REPOSITORY/BatteryLevel.zip tmp/
cp $REPOSITORY/domoticz-ewpe-smart-mqtt-plugin-master.zip tmp/

docker buildx build --platform linux/arm/v7 -t domoticz:$VERSION .
docker save domoticz:$VERSION > domoticz-$VERSION.tar

rm -rf tmp