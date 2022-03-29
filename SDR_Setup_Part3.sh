#!/bin/sh

echo "Completing Audio Mapping"
sudo apt-get install pulseaudio pavucontrol mplayer -y
pulseaudio load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink
pulseaudio -k

echo "Done with SDR Setup!"
