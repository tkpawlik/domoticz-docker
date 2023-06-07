#!/bin/bash

VERSION=1.10.0

docker stop domoticz
docker rm -f domoticz
#docker rm -f ewpe-smart-mqtt
docker rm -f mosquitto

docker run --name mosquitto \
  --network host \
  --restart unless-stopped \
  -d \
  eclipse-mosquitto:2.0.1

#docker run --name ewpe-smart-mqtt \
#  --network host \
#  --restart unless-stopped \
#  -e "DEVICE_POLL_INTERVAL=30000" \
#  -d \
#  ewpe-smart-mqtt:armv7

docker run --name domoticz \
  --network host \
  --tmpfs /tmpfs \
  --device=/dev/ttyUSB0 \
  --device=/dev/ttyACM0 \
  --device=/dev/gpiomem \
  --restart unless-stopped \
  -v /mnt/data/domoticz:/data \
  -v /sys:/sys \
  -e TZ=Europe/Warsaw \
  -d \
  domoticz:$VERSION
docker ps | grep domoticz
docker logs domoticz