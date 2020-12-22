echo "Setup TPM2 TSS Engine"
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
cd ..
