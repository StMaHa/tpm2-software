#!/bin/bash

echo "*** Setup TPM2 TSS Engine ***"
if [ ! -d "/home/pi/tssSetup" ]; then
  mkdir /home/pi/tssSetup
fi

echo "Installing the packages required to build the TSS Engine"
sudo apt -y install \
    build-essential \
    autoconf \automake \
    m4 \
    libtool \
    gcc \
    pkg-config \
    libssl-dev \
    ruby-ronn \
    pandoc \
    expect

echo "Changing the installation directory and downloading the TSS Engine source code"
cd /home/pi/tssSetup
# git clone -b v1.1.x https://github.com/tpm2-software/tpm2-tss-engine.git
git clone https://github.com/tpm2-software/tpm2-tss-engine

echo "Change to the source code directory and bootstrap the TSS Engine"
cd tpm2-tss-engine
./bootstrap

echo "Configuring the TSS Engine"
./configure

echo "Building and installing the TSS Engine"
make -j4
sudo make install
sudo ldconfig
cd /home/pi/tssSetup

echo "Post-installation steps for the TSS Engine"
sudo ldconfig

echo "Configuration file 'tpm2-tss-engine.conf'"
read -p "Press [Enter] key after file updated..."

echo "Export command with exemplary path"
export OPENSSL_CONF=/home/pi/tssSetup/tpm2-tss-engine/tpm2-tss-engine.conf

echo "Sanity-Tests"
openssl engine -t -c tpm2tss
