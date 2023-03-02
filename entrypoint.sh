#!/bin/bash

cleanup() {
  mkdir /data/tmp

  mv /data/*.* /data/tmp

  cp /tmpfs/domoticz.db /data/ 
  cp /tmpfs/zwcfg_0xdbec9d62.xml /data/
  cp /tmpfs/zwscene.xml /data/
  cp /tmpfs/domocookie.txt /data/

  rm -rf /data/tmp
}

trap 'cleanup' SIGTERM

cp /data/* /tmpfs/

ln -sf /tmpfs/domoticz.db-shm /app/
ln -sf /tmpfs/domoticz.db-wal /app/
ln -sf /tmpfs/domoticz.db /app/
ln -sf /tmpfs/zwcfg_0xdbec9d62.xml /app/Config/
ln -sf /tmpfs/zwscene.xml /app/Config/
ln -sf /tmpfs/domocookie.txt /app

/app/domoticz > /dev/null 2>&1 &

wait $!
