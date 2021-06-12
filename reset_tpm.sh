#!/bin/bash

# set path of gpio as variable
GPIO_PATH=/sys/class/gpio
# set gpio pin for tpm reset as variable
RST_PIN=4

# enable usage of gpio pin if needed
if [ ! -e $GPIO_PATH/gpio$RST_PIN ]; then
    echo "$RST_PIN" > $GPIO_PATH/export
fi

# configure gpio pin to be output
echo "out" > $GPIO_PATH/gpio$RST_PIN/direction
# initialy set gpio pin to high
echo 1 > $GPIO_PATH/gpio$RST_PIN/value
# wait 10 micro seconds
sleep 0.00001
# set gpio pin to low to reset tpm
echo 0 > $GPIO_PATH/gpio$RST_PIN/value
# keep reset signal low for some time, wait 10 micro seconds
sleep 0.00001
# release reset signal, set gpio pin to high again
echo 1 > $GPIO_PATH/gpio$RST_PIN/value
# if needed release gpio pin to be not configured
# usleep 10
# echo "$RST_PIN" > $GPIO_PATH/unexport
