echo "Create working directory"
mkdir /home/pi/tssSetup
cd /home/pi/tssSetup

echo "Add user tss"
sudo useradd --system --user-group tss


echo "Setup TPM2 TSS"
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
  
git clone https://github.com/tpm2-software/tpm2-tss
cd tpm2-tss
./bootstrap
./configure --with-udevrulesdir=/etc/udev/rules.d \
            --with-udevrulesprefix=70- \
            --sysconfdir=/etc \
            --localstatedir=/var \
            --runstatedir=/run
make -j4
sudo make install

echo "Post-installation steps for TPM2 TSS"
sudo udevadm control --reload-rules && sudo udevadm trigger
sudo ldconfig

mkdir -p ~/.local/share/tpm2-tss/user/keystore
sudo adduser pi tss


echo "Setup TPM2 Access Broker and Resource Manager"
sudo apt -y install \
   libdbus-1-dev \
   libglib2.0-dev
cd /home/pi/tssSetup
git clone https://github.com/tpm2-software/tpm2-abrmd
cd tpm2-abrmd
./bootstrap
./configure --with-dbuspolicydir=/etc/dbus-1/system.d \
            --with-systemdsystemunitdir=/lib/systemd/system \
            --with-systemdpresetdir=/lib/systemd/system-preset \
            --datarootdir=/usr/share
make -j4
sudo make install

sudo ldconfig
sudo pkill -HUP dbus-daemon
sudo systemctl daemon-reload
sudo systemctl enable tpm2-abrmd.service
sudo systemctl start tpm2-abrmd.service
cd /home/pi/tssSetup


echo "Setup TPM2 Tools"
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
cd /home/pi/tssSetup
git clone https://github.com/tpm2-software/tpm2-tools
cd tpm2-tools/
./bootstrap
./configure
make -j4
sudo make install
sudo ldconfig


echo "Setup TPM2 Tools"
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
git clone https://github.com/tpm2-software/tpm2-tss-engine
cd tpm2-tss-engine
./bootstrap
./configure
make -j4
sudo make install
sudo ldconfig



