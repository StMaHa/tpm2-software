echo "*** Setup TPM2 Access Broker and Resource Manager ***"
echo "Installation of packages required to build the TABRMD"
sudo apt -y install \
   libdbus-1-dev \
   libglib2.0-dev

echo "Change to the installation directory and download the TABRMD source code"
cd /home/pi/tssSetup
git clone https://github.com/tpm2-software/tpm2-abrmd

echo "Change to the source code directory and bootstrap the TABRMD"
cd tpm2-abrmd
./bootstrap

echo "Configuring the TABRMD"
./configure --with-dbuspolicydir=/etc/dbus-1/system.d \
            --with-systemdsystemunitdir=/lib/systemd/system \
            --with-systemdpresetdir=/lib/systemd/system-preset \
            --datarootdir=/usr/share

echo "Building and installing the TABRMD"
make -j4
sudo make install

echo "Post-installation steps for TABRMD"
sudo ldconfig
sudo pkill -HUP dbus-daemon
sudo systemctl daemon-reload
sudo systemctl enable tpm2-abrmd.service
sudo systemctl start tpm2-abrmd.service
cd /home/pi/tssSetup

echo " Sanity Tests"
 dbus-send --system --dest=org.freedesktop.DBus --type=method_call \
--print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames

