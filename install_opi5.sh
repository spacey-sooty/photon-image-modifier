find /

find / -name user-data

apt-get update
apt-get upgrade -y

cd /tmp 
wget https://git.io/JJrEP -O install.sh
chmod +x install.sh

sed -i 's/# AllowCPUs=4-7/AllowCPUs=4-7/g' install.sh

./install.sh

# Remove extra packages too

apt-get purge -y python3 gdb gcc g++ linux-headers* libgcc*-dev *qt*
apt-get autoremove -y

rm -rf /var/lib/apt/lists/*
apt-get clean

rm -rf /usr/share/doc
rm -rf /usr/share/locale/
