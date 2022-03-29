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
echo "rebooting"
sudo reboot
