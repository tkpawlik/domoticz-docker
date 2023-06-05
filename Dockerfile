FROM debian:stretch-slim

WORKDIR /app

RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list
RUN sed -i -e 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list
RUN sed -i -e '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update

COPY tmp/* .

RUN apt-get -y install libusb-dev libcurl4-openssl-dev libpython3-dev
RUN dpkg -i libssl1.0.0_1.0.1t-1+deb8u7_armhf.deb
RUN tar -zxf domoticz_linux_armv7l.tgz

RUN dpkg -i wiringpi_2.50_armhf.deb

RUN apt-get -y install sqlite

RUN apt-get -y install unzip
RUN unzip BatteryLevel.zip -d plugins
RUN unzip domoticz-ewpe-smart-mqtt-plugin-master.zip -d plugins

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]