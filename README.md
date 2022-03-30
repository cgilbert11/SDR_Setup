# SDR_Setup
## Tools for receiving, transmitting, and decoding HF and other frequencies

- Tools Contained in this repo:
	- GQRX
	- WSJT-X
	- RTL-SDR Drivers
	- Audio apps


### Installing:
Run the following 3 lines in your terminal to install
```
git clone https://github.com/cgilbert11/SDR_Setup
cd SDR_Setup
sh Install_SDR_Setup.sh
```
Then, after reboot, set up the audio

```
pacmd load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink
```
Or, to make Virutal_Sink permanent, run this:

```
sudo nano /etc/pulse/default.pa
```
Then add the following to the end of the file
```
pacmd load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink
```
Then Save (CTRL+o),enter, exit (CTRL+X)

### Setting up

#### GQRX Setup  
##### When you launch GQRX for the first time a window will come up asking you to configure I/O devices:
- Configure I/O device:  
 	- Select Your Device  
 	- Select Virtual_Sink for your audio output device  
 ##### Now, once GQRX launches there are 3 tabs at the bottom (Input Controls, Receiver Options, and FFT Settings)
 Copy the settings below:
 
- Input Controls:  
	- Set “No Limits”  
- Receiver Options:  
	- Mode: USB  

##### Finally, go to the top tool bar and click on "Tools", do the following,
- Tools  
	- Click on Remote Control Settings then write down allowed host  
	- Enable Remote Control

#### WSJT-X Setup
- Go to Settings
	- Radio Tab
		- For your rig, put: Hamlib.NET rig.ctl
		- For Network Server put: <allowed host from GQRX>
	- Audio
		- Input: Virtual_Sink.monitor
		- Output: default
	 	- Click Test CAT button - should turn green
		- Scroll to bottom - click ok
	- Click Mode tab on the top = change to FT8 (or a different band)

### Receiving Signals
- One of the easier frequencies to get is WFM (FM Radio) - only test this with GQRX not WSJT-X
	- Change GQRX mode to WFM
	- tune to a local fm station
	- you should see some large spikes, you can also plug headphones and listen directly
	Change GQRX
- In GQRX, set frequency to 28.074 MHz  
     - This is the 10m band of FT8  
     - The SDR Dongle has a range of about 25 – 1750 MHz  
- Next, open WSJT-X and it should automatically be taking in data from GQRX    
     - WSJT-X may alter your frequency a bit so just change it back in GQRX  
- After all of this, you should start seeing FT8 10m messages coming through  
