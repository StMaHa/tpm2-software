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

git clone https://github.com/tpm2-software/tpm2-tools
cd tpm2-tools
./bootstrap
./configure
make -j4
sudo make install
sudo ldconfig
cd ..
