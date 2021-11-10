#!/bin/bash

echo "*** Setup TPM2 Tools ***"
if [ ! -d "/home/pi/tssSetup" ]; then
  mkdir /home/pi/tssSetup
fi

echo "Installation of packages required to build the TPM2 Tools"
sudo apt -y install \
    autoconf \
    automake \
    libtool \
    pkg-config \
    gcc \
    libssl-dev \
    libcurl4-gnutls-dev \
    pandoc \
    python-yaml \
    expect

echo "Change to the installation directory and download the TPM2 Tools source code"
cd /home/pi/tssSetup
# git clone -b 4.2.X https://github.com/tpm2-software/tpm2-tools.git
git clone https://github.com/tpm2-software/tpm2-tools

echo "Change to the source code directory and bootstrap the TPM2 Tools"
cd tpm2-tools/
./bootstrap

echo "Configuring the TPM2 Tools"
./configure

echo "Building and Installing the TPM2 Tools"
make -j4
sudo make install
sudo ldconfig
cd /home/pi/tssSetup
