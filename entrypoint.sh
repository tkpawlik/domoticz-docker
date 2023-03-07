#!/bin/bash

cleanup() {
  mkdir /data/tmp

  mv /data/domoticz.db /data/tmp/
  cp /tmpfs/domoticz.db /data/

  chmod +x /data/on-shutdown.sh
  /data/on-shutdown.sh

  rm -rf /data/tmp
}

trap 'cleanup' SIGTERM

mkdir -p /tmpfs

cp /data/domoticz.db /tmpfs/
ln -sf /tmpfs/domoticz.db /app/
ln -sf /tmpfs/domoticz.db-shm /app/
ln -sf /tmpfs/domoticz.db-wal /app/
ln -sf /tmpfs/domocookie.txt /app

chmod +x /data/on-startup.sh
/data/on-startup.sh

/app/domoticz > /dev/null 2>&1 &

wait $!