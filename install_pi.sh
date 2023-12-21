# Run normal photon instarller

cd /tmp 
wget https://git.io/JJrEP -O install.sh
chmod +x install.sh
sudo ./install.sh

# and edit boot partition

find /boot/
cat /boot/config.txt

install -m 644 config.txt /boot/
install -m 644 userconf.txt /boot/
