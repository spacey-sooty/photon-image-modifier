#!/bin/bash -v

# Verbose and exit on errors
set -ex

# Run the pi install script
chmod +x ./install_pi.sh
./install_pi.sh

# I want these for testing
sudo apt install python3
pip install smbus2 --break-system-packages

# Install our new config.txt with OV9281 overlay
install -m 644 limelight4/config.txt /boot/
