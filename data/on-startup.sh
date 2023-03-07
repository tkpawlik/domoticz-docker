#!/bin/bash

cp /data/zwcfg_0xdbec9d62.xml /tmpfs/
ln -sf /tmpfs/zwcfg_0xdbec9d62.xml /app/Config/

gpio export 4 in
echo both > /sys/class/gpio/gpio4/edge

gpio export 17 in
echo both > /sys/class/gpio/gpio17/edge
gpio -g mode 17 up

gpio export 27 in
echo both > /sys/class/gpio/gpio27/edge
gpio -g mode 27 up

gpio export 9 in
echo both > /sys/class/gpio/gpio9/edge
gpio -g mode 9 up

gpio export 5 in
echo both > /sys/class/gpio/gpio5/edge
gpio -g mode 5 up

gpio export 6 in
echo both > /sys/class/gpio/gpio6/edge
gpio -g mode 6 up

gpio export 13 in
echo both > /sys/class/gpio/gpio13/edge
gpio -g mode 13 up

gpio export 19 in
echo both > /sys/class/gpio/gpio19/edge
gpio -g mode 19 up

gpio export 26 in
echo both > /sys/class/gpio/gpio26/edge