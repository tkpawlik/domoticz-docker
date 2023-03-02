#!/bin/bash

docker rm -f domoticz
docker run --name domoticz \
  -v /ram:/tmpfs \
  -v $(pwd)/data:/data \
  --device=/dev/ttyUSB0 \
  --device=/dev/ttyACM0 \
  --device=/dev/gpiomem \
  -v /sys:/sys \
  -e TZ=Europe/Warsaw \
  -p 8080:8080 \
  -d \
  domoticz:1.0.0
docker ps | grep domoticz
