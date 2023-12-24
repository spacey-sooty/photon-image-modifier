# Run normal photon instarller

pushd .
cd /tmp 
wget https://git.io/JJrEP -O install.sh
chmod +x install.sh
./install.sh

sudo apt-get update
apt-get install -y pigpiod pigpio device-tree-compiler dhcpcd5 network-manager net-tools

# and edit boot partition
popd
install -m 644 config.txt /boot/
install -m 644 userconf.txt /boot/

# Kill wifi and other networking things
install -v -m 644 files/wait.conf /etc/systemd/system/dhcpcd.service.d/
install -v files/rpi-blacklist.conf /etc/modprobe.d/blacklist.conf

# Enable ssh
systemctl enable ssh

# Remove extra packages too

# apt-get purge -y python3 gdb gcc g++ linux-headers* libgcc*-dev *qt*
# apt-get autoremove -y

# rm -rf /var/lib/apt/lists/*
# apt-get clean

# rm -rf /usr/share/doc
# rm -rf /usr/share/locale/
