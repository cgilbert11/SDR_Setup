#!/bin/sh

#####################################################################################
#                            SDR  SETUP SCRIPT                                      #
#####################################################################################
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Permission is hereby granted, free of charge, to any person obtaining a copy      #
# of this software and associated documentation files (the "Software"), to deal     #
# in the Software without restriction, including without limitation the rights      #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell         #
# copies of the Software, and to permit persons to whom the Software is             #
# furnished to do so, subject to the following conditions:                          #
#                                                                                   #
# The above copyright notice and this permission notice shall be included in all    #
# copies or substantial portions of the Software.                                   #
#                                                                                   #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR        #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,          #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE       #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER            #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,     #
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE     #
# SOFTWARE.                                                                         #
#                                                                                   #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


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


echo "Installing WSJT-X Dependencies"
cd
sudo apt install -y qtmultimedia5-dev libqt5serialport5-dev qttools5-dev
sudo apt install -y  qttools5-dev-tools libqt5multimedia5-plugins
sudo apt install -y libboost-all-dev libfftw3-dev libreadline-dev
sudo apt install -y libudev-dev portaudio19-dev libgfortran5

echo "done"
echo "creating directories"

cd
mkdir build
cd build
wget https://physics.princeton.edu/pulsar/k1jt/wsjtx-2.5.4.tgz
tar xzf wsjtx-2.5.4.tgz
mv wsjtx-2.5.4.tgz ../
cd build
mkdir build
cd build

echo "installing WSJT-X"
cmake -DWSJT_SKIP_MANPAGES=ON -DWSJT_GENERATE_DOCS=OFF ../wsjtx-2.5.4
sudo cmake --build . --target install

echo "Completing Audio Mapping"
sudo apt-get install pulseaudio pavucontrol mplayer -y
pacmd load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink
pulseaudio -k

echo "Done with SDR Setup!"
echo "Rebooting Now"

sudo reboot
