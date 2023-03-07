#!/bin/bash

cleanup() {
  mkdir /data/tmp

  mv /data/domoticz.db /data/tmp/
  cp /tmpfs/domoticz.db /data/

  mv /data/zwcfg_0xdbec9d62.xml /data/tmp/
  cp /tmpfs/zwcfg_0xdbec9d62.xml /data/

  mv /data/zwscene.xml /data/tmp/
  cp /tmpfs/zwscene.xml /data/

  mv /data/domocookie.txt /data/tmp/
  cp /tmpfs/domocookie.txt /data/

  rm -rf /data/tmp
}

trap 'cleanup' SIGTERM

mkdir -p /tmpfs

ln -sf /tmpfs/domoticz.db-shm /app/
ln -sf /tmpfs/domoticz.db-wal /app/
ln -sf /tmpfs/OZW_Log.txt /app/Config/OZW_Log.txt

cp /data/domoticz.db /tmpfs/
ln -sf /tmpfs/domoticz.db /app/

cp /data/zwcfg_0xdbec9d62.xml /tmpfs/
ln -sf /tmpfs/zwcfg_0xdbec9d62.xml /app/Config/

cp /data/zwscene.xml /tmpfs/
ln -sf /tmpfs/zwscene.xml /app/Config/

cp /data/domocookie.txt /tmpfs/
ln -sf /tmpfs/domocookie.txt /app

mkdir /tmpfs/BatteryLevel
ln -sf /tmpfs/BatteryLevel /app/plugins/BatteryLevel/__pycache__

chmod +x /data/gpio.sh
/data/gpio.sh

/app/domoticz > /dev/null 2>&1 &

wait $!