#!/bin/sh

echo "Installing GQRX"
sudo apt install -y gqrx-sdr
sudo apt-get remove -y rtl-sdr

echo "Installing SDR Drivers"
git clone https://github.com/osmocom/rtl-sdr.git
sudo apt install -y build-essential cmake usbutils libusb-1.0-0-dev
cd rtl-sdr
mkdir build
cd build
cmake -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON ../
sudo make install
sudo ldconfig
echo 'blacklist dvb_usb_rtl28xxu' | sudo tee – append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
sudo reboot
