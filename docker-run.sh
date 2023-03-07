#!/bin/bash

docker stop domoticz
docker rm -f domoticz
docker run --name domoticz \
  --tmpfs /tmpfs \
  --device=/dev/ttyUSB0 \
  --device=/dev/ttyACM0 \
  --device=/dev/gpiomem \
  --restart unless-stopped \
  -v $(pwd)/data:/data \
  -v /sys:/sys \
  -e TZ=Europe/Warsaw \
  -p 8080:8080 \
  -d \
  domoticz:1.3.0
docker ps | grep domoticz
docker logs domoticz