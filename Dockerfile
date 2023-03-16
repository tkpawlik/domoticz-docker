FROM raspbian/stretch:041518

WORKDIR /app

RUN apt-get update

RUN apt-get -y install libusb-dev libcurl4-openssl-dev libpython3-dev
COPY libssl1.0.0_1.0.1t-1+deb8u7_armhf.deb .
COPY domoticz_linux_armv7l.tgz .
RUN dpkg -i libssl1.0.0_1.0.1t-1+deb8u7_armhf.deb
RUN tar -zxf domoticz_linux_armv7l.tgz

COPY wiringpi_2.50_armhf.deb .
RUN dpkg -i wiringpi_2.50_armhf.deb

COPY plugins plugins

RUN apt-get -y install sqlite

COPY dht22.bin .

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]