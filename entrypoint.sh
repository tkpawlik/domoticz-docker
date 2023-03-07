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

#mkdir /tmpfs/BatteryLevel
#ln -sf /tmpfs/BatteryLevel /app/plugins/BatteryLevel/__pycache__

#mkdir /tmpfs/python
#ln -sf /tmpfs/python /usr/lib/python3.5/__pycache__

#mkdir /tmpfs/python-collections
#ln -sf /tmpfs/python-collections /usr/lib/python3.5/collections/__pycache__

#mkdir /tmpfs/python-plat-arm-linux-gnueabihf
#ln -sf /tmpfs/python-plat-arm-linux-gnueabihf /usr/lib/python3.5/plat-arm-linux-gnueabihf/__pycache__

#mv /app/www/images /tmpfs/images
#ln -sf /tmpfs/images /app/www/image

ln -sf /tmpfs/domoticz.db-shm /app/
ln -sf /tmpfs/domoticz.db-wal /app/
ln -sf /tmpfs/domocookie.txt /app
ln -sf /tmpfs/OZW_Log.txt /app/Config/OZW_Log.txt
ln -sf /tmpfs/zwscene.xml /app/Config/

chmod +x /data/on-startup.sh
/data/on-startup.sh

/app/domoticz > /dev/null 2>&1 &

wait $!