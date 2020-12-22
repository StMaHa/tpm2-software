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
