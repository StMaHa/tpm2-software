echo "Setup TPM2 TSS"
echo "Add user tss"
sudo useradd --system --user-group tss

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
