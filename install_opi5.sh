find /

find / -name user-data

apt-get update
apt-get upgrade -y

cd /tmp 
wget https://git.io/JJrEP -O install.sh
chmod +x install.sh

sed -i 's/# AllowedCPUs=4-7/AllowedCPUs=4-7/g' install.sh

./install.sh

if id "$1" >/dev/null 2>&1; then
    echo 'user found'
else
    echo "creating pi user"
    useradd pi -b /home
fi

echo "pi:raspberry" | chpasswd

# Remove extra packages too

apt-get purge -y python3 gdb gcc g++ linux-headers* libgcc*-dev *qt*
apt-get autoremove -y

rm -rf /var/lib/apt/lists/*
apt-get clean

rm -rf /usr/share/doc
rm -rf /usr/share/locale/
