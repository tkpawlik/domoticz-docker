#!/bin/bash

# ./docker-build-amd64.sh /home/tkpawlik/Dropbox/repository

REPOSITORY=$1
VERSION=1.6.0

cp $REPOSITORY/domoticz_linux_armv7l.tgz ./
cp $REPOSITORY/libssl1.0.0_1.0.1t-1+deb8u7_armhf.deb ./
cp $REPOSITORY/wiringpi_2.50_armhf.deb ./
cp $REPOSITORY/dht22.bin ./

docker buildx build --platform linux/arm/v7 -t domoticz:$VERSION .
docker save domoticz:$VERSION > domoticz-$VERSION.tar

rm -f domoticz_linux_armv7l.tgz
rm -f libssl1.0.0_1.0.1t-1+deb8u7_armhf.deb
rm -f dht22.bin
rm -f wiringpi_2.50_armhf.deb