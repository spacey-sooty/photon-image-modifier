
# Create pi/raspberry login
if id "$1" >/dev/null 2>&1; then
    echo 'user found'
else
    echo "creating pi user"
    useradd pi -b /home
    usermod -a -G sudo pi
    mkdir /home/pi
    chown -R pi /home/pi
fi
echo "pi:raspberry" | chpasswd

apt-get update
wget https://git.io/JJrEP -O install.sh
chmod +x install.sh

sed -i 's/# AllowedCPUs=4-7/AllowedCPUs=4-7/g' install.sh

./install.sh
rm install.sh

sudo apt-get update
apt-get install -y network-manager net-tools 
apt-mark manual netplan.io

cat > /etc/netplan/00-default-nm-renderer.yaml <<EOF
network:
  renderer: NetworkManager
EOF

# Remove extra packages 

apt-get remove -y gdb gcc g++ linux-headers* libgcc*-dev
apt-get autoremove -y

rm -rf /var/lib/apt/lists/*
apt-get clean

rm -rf /usr/share/doc
rm -rf /usr/share/locale/
