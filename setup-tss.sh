#!/bin/bash

echo "*** Setup TPM2 TSS ***"
echo "*** Pre-Installation ***"
if [ ! -d "/home/pi/tssSetup" ]; then
  mkdir /home/pi/tssSetup /home/pi/codeExamples /home/pi/usageExamples
fi

echo "Add user tss"
sudo useradd --system --user-group tss

echo "Installation of packages required to build the TSS"
sudo apt update
sudo apt -y install \
  autoconf-archive \
  libcmocka0 \
  libcmocka-dev \
  procps \
  iproute2 \
  build-essential \
  git \
  pkg-config \
  gcc \
  libtool \
  automake \
  libssl-dev \
  uthash-dev \
  autoconf \
  doxygen \
  libjson-c-dev \
  libini-config-dev \
  libcurl4-gnutls-dev

echo "*** Installation ***"
echo "Change to the installation directory and download the TSS"
cd /home/pi/tssSetup
# git clone -b 3.0.x https://github.com/tpm2-software/tpm2-tss.git
git clone https://github.com/tpm2-software/tpm2-tss

echo "Change to the source code directory and bootstrap the TSS"
cd tpm2-tss
./bootstrap

echo "Configuring the TSS"
./configure --with-udevrulesdir=/etc/udev/rules.d \
            --with-udevrulesprefix=70- \
            --sysconfdir=/etc \
            --localstatedir=/var \
            --runstatedir=/run

echo "Compiling and installing of the TSS"
make -j4
sudo make install

echo "Post-installation steps for TSS"
sudo udevadm control --reload-rules && sudo udevadm trigger
sudo ldconfig
cd /home/pi/tssSetup

echo "*** FAPI Configuration ***"
echo "Creation of the user keystore"
mkdir -p ~/.local/share/tpm2-tss/user/keystore
sudo adduser pi tss

echo "Command to check if current user was correctly added to the group tss"
groups | grep tss

echo "Default FAPI Configuration File (with ECC selected)"
export TSS2_FAPICONF=/etc/tpm2-tss/fapi-config.json

echo "Default ECC Profile (/etc/tpm2-tss/fapi-profiles/P_ECCP256SHA256.json)"
