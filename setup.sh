#!/bin/bash

echo "Create working directory"
mkdir /home/pi/tssSetup
cd /home/pi/tssSetup

echo "Setup everything..."
./setup-tss.sh
./setup-abrmd.sh
./setup-tpm2-tools.sh
./setup-engine.sh
